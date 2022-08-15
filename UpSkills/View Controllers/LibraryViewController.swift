import UIKit
import Combine
import SwiftUI

class LibraryViewController: UIViewController {

  @IBOutlet var topicsTableView: UITableView!
  @IBOutlet var sectionsCollectionView: UICollectionView!
  @IBOutlet var tableViewHeight: NSLayoutConstraint!
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var certificatesLabel: UILabel!
  
  private var tokens: Set<AnyCancellable> = []
  
  override func viewDidLoad() {
        super.viewDidLoad()
    sectionsCollectionView.delegate = self
    sectionsCollectionView.dataSource = self
    sectionsCollectionView.layer.masksToBounds = false
     
    topicsTableView.delegate = self
    topicsTableView.dataSource = self
    topicsTableView.layer.masksToBounds = false
    topicsTableView.publisher(for: \.contentSize).sink { newContentSize in self.tableViewHeight.constant = newContentSize.height}.store(in: &tokens)
    
    titleLabel.adjustsFontForContentSizeCategory = true
    titleLabel.font = UIFont.preferredFont(for: .title2, weight: .bold)
    titleLabel.maximumContentSizeCategory = .accessibilityLarge
    
    certificatesLabel.adjustsFontForContentSizeCategory = true
    certificatesLabel.font = UIFont.preferredFont(for: .footnote, weight: .semibold)
    certificatesLabel.maximumContentSizeCategory = .accessibilityExtraLarge
    }

  @IBSegueAction func createCertificates(_ coder: NSCoder) -> UIViewController? {
    let v = UIHostingController(coder: coder, rootView: CertificateView())!
    v.view.backgroundColor = .clear
    return v
  }
}

extension LibraryViewController: UICollectionViewDataSource, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return sections.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionsCell", for: indexPath) as! SectionsCollectionViewCell
    
    let section = sections[indexPath.item]
    cell.titleLabel.text = section.sectionTitle
    cell.subtitleLabel.text = section.sectionSubtitle
    cell.logo.image = section.sectionIcon
    cell.banner.image = section.sectionBanner
    return cell
  }
}

extension LibraryViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return topics.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TopicsCell", for: indexPath) as! TopicsTableViewCell
    let setting = librarySettings[indexPath.row]
    cell.topicLabel.text = setting.topicName
    cell.topicIcon.image = UIImage(systemName: setting.topicSymbol)
    return cell
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
}
