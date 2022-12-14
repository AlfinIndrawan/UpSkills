import UIKit
import Combine
import FirebaseFirestore

class NotificationsViewController: UIViewController {

  @IBOutlet var tableViewHeight: NSLayoutConstraint!
  @IBOutlet var cardView: CustomView!
  @IBOutlet var tableView: UITableView!
  
  var dataSource: UITableViewDiffableDataSource<TBSection, NotificationModel>! =  nil
  var currentSnapshot: NSDiffableDataSourceSnapshot<TBSection, NotificationModel>! = nil
  private var tokens: Set<AnyCancellable> = []
  
  override func viewDidLoad() {
        super.viewDidLoad()
    tableView.publisher(for: \.contentSize).sink { newContentSize in self.tableViewHeight.constant = newContentSize.height}.store(in: &tokens)
    tableView.delegate = self
    
    // configure data source
    self.dataSource = UITableViewDiffableDataSource<TBSection, NotificationModel>(tableView: tableView) {
        ( tableView: UITableView, indexPath: IndexPath, item: NotificationModel) -> NotificationTableViewCell in
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell", for: indexPath) as? NotificationTableViewCell else {
            fatalError("Can't create new cell")
        }
        
        cell.titleLabel.text = item.title
        cell.messageLabel.text = item.message
        cell.subtitleLabel.text = item.subtitle.uppercased()
        cell.courseLogo.image = UIImage(named: item.image)
        
        return cell
        
      }
    self.dataSource.defaultRowAnimation = .fade
    Task {
      do {
        try await loadData()
      } catch let error {
        print("Error: \(error.localizedDescription)")
      }
    }
    
    }
  func loadData() async throws {
    currentSnapshot = NSDiffableDataSourceSnapshot <TBSection, NotificationModel>()
    currentSnapshot.appendSections([.main])
    // loading data from firebase in order of time
    let docs = try await Firestore.firestore().collection("notifications").order(by: "sentAt", descending: true).getDocuments()
    var notifications = [NotificationModel]()
    // every iterations of document i transform it to notifications model
    for snapshot in docs.documents {
      let data = try snapshot.data(as: NotificationModel.self)
      // apend data
      notifications.append(data)
    }
    // apply snapshot to datasource async
    self.currentSnapshot.appendItems(notifications, toSection: .main)
    await self.dataSource.apply(currentSnapshot, animatingDifferences: true )
    DispatchQueue.main.async {
      self.cardView.alpha = 1
    }
  }
}

extension NotificationsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}
