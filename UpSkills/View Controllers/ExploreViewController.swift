import UIKit
import Combine

class ExploreViewController: UIViewController {

  @IBOutlet var popularCollectionView: UICollectionView!
  @IBOutlet var topicsTableView: UITableView!
  @IBOutlet var sectionsCollectionView: UICollectionView!
  @IBOutlet var tableViewHeight: NSLayoutConstraint!
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var topicLabel: UILabel!
  @IBOutlet var popularLabel: UILabel!
  private var tokens: Set<AnyCancellable> = []
  override func viewDidLoad() {
        super.viewDidLoad()
    sectionsCollectionView.delegate = self
    sectionsCollectionView.dataSource = self
    sectionsCollectionView.layer.masksToBounds = false
    
    popularCollectionView.delegate = self
    popularCollectionView.dataSource = self
    popularCollectionView.layer.masksToBounds = false
    
    topicsTableView.delegate = self
    topicsTableView.dataSource = self
    topicsTableView.layer.masksToBounds = false
    topicsTableView.publisher(for: \.contentSize).sink{newContentSize in self.tableViewHeight.constant = newContentSize.height}.store(in: &tokens)
    
    titleLabel.adjustsFontForContentSizeCategory = true
    titleLabel.font = UIFont.preferredFont(for: .title2, weight: .bold)
    titleLabel.maximumContentSizeCategory = .accessibilityLarge
    
    topicLabel.adjustsFontForContentSizeCategory = true
    topicLabel.font = UIFont.preferredFont(for: .footnote, weight: .semibold)
    topicLabel.maximumContentSizeCategory = .accessibilityExtraLarge
    
    popularLabel.adjustsFontForContentSizeCategory = true
    popularLabel.font = UIFont.preferredFont(for: .footnote, weight: .semibold)
    popularLabel.maximumContentSizeCategory = .accessibilityExtraLarge
    }

}

extension ExploreViewController: UICollectionViewDataSource, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if collectionView == sectionsCollectionView {
      return sections.count
    } else {
      return handbooks.count
    }

  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if collectionView == sectionsCollectionView {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionsCell", for: indexPath) as! SectionsCollectionViewCell
    
    let section = sections[indexPath.item]
    cell.titleLabel.text = section.sectionTitle
    cell.subtitleLabel.text = section.sectionSubtitle
    cell.logo.image = section.sectionIcon
    cell.banner.image = section.sectionBanner
    return cell
    }
    else {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseCell", for: indexPath) as! HandbookCollectionViewCell
      
      let handbook = handbooks[indexPath.item]
      cell.titleLabel.text = handbook.courseTitle
      cell.subtitleLabel.text = handbook.courseSubtitle
      cell.descriptionLabel.text = handbook.courseDescription
      cell.gradient.colors =  handbook.courseGradient
      cell.logo.image = handbook.courseIcon
      cell.banner.image = handbook.courseBanner
      return cell
    }
  }
}

extension ExploreViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return topics.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TopicsCell", for: indexPath) as! TopicsTableViewCell
    let Topic = topics[indexPath.row]
    cell.topicLabel.text = Topic.topicName
    cell.topicIcon.image = UIImage(systemName: Topic.topicSymbol)
    return cell
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
}
