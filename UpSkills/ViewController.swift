import UIKit

class ViewController: UIViewController {
  @IBOutlet var cardView: UIView!
  @IBOutlet var blurView: UIVisualEffectView!
  @IBOutlet var handbooksCollectionView: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    handbooksCollectionView.delegate = self
    handbooksCollectionView.dataSource = self
  }

}
 
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 2
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseCell", for: indexPath) as! HandbookCollectionViewCell
    cell.titleLabel.text = "SwiftUI Handbook"
    cell.subtitleLabel.text = "20 Hours - 30 Sections"
    cell.descriptionLabel.text = "Learn basics of SwiftUI"
    cell.gradient.colors =  [UIColor.red.cgColor, UIColor.systemPink.cgColor]
    cell.logo.image = UIImage(named: "Logo React")
    cell.banner.image = UIImage(named: "Illustration 2")
    return cell
  }
}
