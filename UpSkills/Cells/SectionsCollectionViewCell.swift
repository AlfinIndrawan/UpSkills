import UIKit

class SectionsCollectionViewCell: UICollectionViewCell {
  @IBOutlet var banner: UIImageView!
  @IBOutlet var logo: CustomImageView!
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var subtitleLabel: UILabel!

  override public func layoutSubviews() {
    super.layoutSubviews()
    super.layoutIfNeeded()
  }
  override func awakeFromNib() {
    super.awakeFromNib()
    layer.shadowColor = UIColor(named: "Shadow")!.cgColor
    layer.shadowOpacity = 0.25
    layer.shadowOffset = CGSize(width: 0, height: 5)
    layer.shadowRadius = 10
    layer.masksToBounds = false
    layer.cornerRadius = 30
    layer.cornerCurve = .continuous
    
    titleLabel.adjustsFontForContentSizeCategory = true
    titleLabel.font = UIFont.preferredFont(for: .body, weight: .bold)
    titleLabel.maximumContentSizeCategory = .extraExtraLarge
    
    subtitleLabel.adjustsFontForContentSizeCategory = true
    subtitleLabel.font = UIFont.preferredFont(for: .caption1, weight: .regular)
    subtitleLabel.maximumContentSizeCategory = . extraLarge
    
  }
  // this function run a particular collection view cell is about to be reused for a new view
  // ex we have 10 cells but we cant show 10 cell at same time, if we can show 3 cells then when it goes out frame , uikit will reuse the same cells to perserve memory and energy
  override public func prepareForReuse() {
    super.prepareForReuse()
  }
}
