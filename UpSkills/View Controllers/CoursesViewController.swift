import UIKit
import Combine

class CoursesViewController: UIViewController {

  var course: Course?
  @IBOutlet var bannerImage: UIImageView!
  @IBOutlet var backgroundImage: UIImageView!
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var authorLabel: UILabel!
  @IBOutlet var descriptionLabel: UILabel!
  @IBOutlet var subtitleLabel: UILabel!
  @IBOutlet var menuButton: UIButton!
  @IBOutlet var iconImageView: CustomImageView!
  
  @IBOutlet var sectionsTableView: UITableView!
  @IBOutlet var tableViewHeight: NSLayoutConstraint!
  private var tokens: Set<AnyCancellable> = []

  override func viewDidLoad() {
        super.viewDidLoad()
    sectionsTableView.delegate = self
    sectionsTableView.dataSource = self
    sectionsTableView.publisher(for: \.contentSize).sink { newContentSize in self.tableViewHeight.constant = newContentSize.height}.store(in: &tokens)
 
    self.iconImageView.image = course?.courseIcon
    self.bannerImage.image = course?.courseBanner
    self.subtitleLabel.text = course?.courseSubtitle
    self.titleLabel.text = course?.courseTitle
    self.descriptionLabel.text = course?.courseDescription
    self.authorLabel.text = "Taught by \(course?.courseAuthor?.formatted(.list(type: .and, width: .standard)) ?? "Taught by design+code")"
      
    // create menu
    let menu = UIMenu(title: "Course Options", options: .displayInline,
      children: [
      UIAction(title: "Share", image: UIImage(systemName: "square.and.arrow.up"), handler: { _ in }),
      UIAction(title: "Take test", image: UIImage(systemName: "highlighter"), handler: { _ in }),
      UIAction(title: "Download", image: UIImage(systemName: "square.and.arrow.down"), handler: { _ in }),
      UIAction(title: "Forums", image: UIImage(systemName: "chevron.left.forwardslash.chevron.right"), handler: { _ in })
      ]
    )
    menuButton.showsMenuAsPrimaryAction = true
    menuButton.menu = menu
    }
    
  @IBAction func goBack(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
}

extension CoursesViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.course?.sections?.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "SectionCell", for: indexPath) as! SectionTableViewCell
    if let selectedCourse = course {
      let selectedSection = selectedCourse.sections![indexPath.row]
      cell.titleLabel.text = selectedSection.sectionTitle
      cell.descriptionLabel.text = selectedSection.sectionDescription
      cell.courseLogo.image = selectedSection.sectionIcon
      cell.subtitleLabel.text = selectedSection.sectionSubtitle
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
}
