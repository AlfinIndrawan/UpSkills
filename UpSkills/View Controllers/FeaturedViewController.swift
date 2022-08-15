import UIKit
import Combine

class FeaturedViewController: UIViewController {
  @IBOutlet var cardView: UIView!
  @IBOutlet var blurView: UIVisualEffectView!
  @IBOutlet var handbooksCollectionView: UICollectionView!
  @IBOutlet var coursesTableView: UITableView!
  @IBOutlet var tableViewHeight: NSLayoutConstraint!
  @IBOutlet var scrollView: UIScrollView!
  @IBOutlet var featuredTitleLabel: UILabel!
  @IBOutlet var featuredSubtitleLabel: UILabel!
  @IBOutlet var featuredDescLabel: UILabel!
  @IBOutlet var coursesLabel: UILabel!
  @IBOutlet var handbooksLabel: UILabel!
  // we are going to store all of listener that we create in regards of combine. Listen any of changes and store listener inside
  private var tokens: Set<AnyCancellable> = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    handbooksCollectionView.delegate = self
    handbooksCollectionView.dataSource = self
    handbooksCollectionView.layer.masksToBounds = false
    coursesTableView.delegate = self
    coursesTableView.dataSource = self
    coursesTableView.layer.masksToBounds = false
    // any time it receive a value of cgsize or content size
    coursesTableView.publisher(for: \.contentSize).sink { newContentSize in self.tableViewHeight.constant = newContentSize.height}.store(in: &tokens)
    scrollView.delegate = self
    featuredTitleLabel.adjustsFontForContentSizeCategory = true
    featuredTitleLabel.font = UIFont.preferredFont(for: .title1, weight: .bold)
    featuredTitleLabel.maximumContentSizeCategory = .accessibilityExtraLarge
    
    featuredSubtitleLabel.adjustsFontForContentSizeCategory = true
    featuredSubtitleLabel.font = UIFont.preferredFont(for: .footnote, weight: .bold)
    featuredSubtitleLabel.maximumContentSizeCategory = .accessibilityMedium
    
    featuredDescLabel.adjustsFontForContentSizeCategory = true
    featuredDescLabel.font = UIFont.preferredFont(for: .footnote, weight: .regular)
    featuredDescLabel.maximumContentSizeCategory = .accessibilityMedium
    
    handbooksLabel.adjustsFontForContentSizeCategory = true
    handbooksLabel.font = UIFont.preferredFont(for: .footnote, weight: .semibold)
    handbooksLabel.maximumContentSizeCategory = .accessibilityExtraLarge
    
    coursesLabel.adjustsFontForContentSizeCategory = true
    coursesLabel.font = UIFont.preferredFont(for: .footnote, weight: .semibold)
    coursesLabel.maximumContentSizeCategory = .accessibilityExtraLarge
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let detailsVC = segue.destination as? CoursesViewController, let course = sender as? Course {
      detailsVC.course = course
    }
  }

}
 
extension FeaturedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return handbooks.count
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
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

extension FeaturedViewController: UITableViewDelegate, UITableViewDataSource {

  func numberOfSections(in tableView: UITableView) -> Int {
    return courses.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CoursesTableCell", for: indexPath) as! CoursesTableViewCell
    let course = courses[indexPath.section]
    cell.titleLabel.text = course.courseTitle
    cell.subtitleLabel.text = course.courseSubtitle
    cell.descriptionLabel.text = course.courseDescription
    cell.courseBackground.image = course.courseBackground
    cell.courseBanner.image = course.courseBanner
    cell.courseLogo.image = course.courseIcon
    
    return cell
  }
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    if section == 0 {
      return 0
    }
    return 20
  }
  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return 0
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let selectedCourse = courses[indexPath.section]
    performSegue(withIdentifier: "presentCourse", sender: selectedCourse)
  }
}

extension FeaturedViewController: UIScrollViewDelegate {
  // this run anytime the scroll view has scrolled
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let contentHeight = scrollView.contentSize.height
    let lastScrollYPos = scrollView.contentOffset.y
    let percentage = lastScrollYPos / contentHeight
    if percentage < 0.15 {
      self.title = "Featured"
    } else if percentage <= 0.33 {
      self.title = "Handbooks"
    } else {
      self.title = "Courses"
    }
  }
}
