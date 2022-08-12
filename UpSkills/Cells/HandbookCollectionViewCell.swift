import UIKit

class HandbookCollectionViewCell: UICollectionViewCell {
  @IBOutlet var overlay: UIView!
  @IBOutlet var banner: UIImageView!
  @IBOutlet var logo: CustomImageView!
  @IBOutlet var progressBar: UIProgressView!
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var subtitleLabel: UILabel!
  @IBOutlet var descriptionLabel: UILabel!
  let gradient = CAGradientLayer()
  
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
    // x 0 y 0 means upper left x1 y1 means upper right and so on
    gradient.startPoint = CGPoint(x: 0, y: 0)
    gradient.endPoint = CGPoint(x: 1, y: 1)
    gradient.frame = overlay.frame
    gradient.cornerCurve = .continuous
    gradient.cornerRadius = 30
    overlay.layer.insertSublayer(gradient, at: 0)
    overlay.layer.cornerRadius = 30
    overlay.layer.cornerCurve = .continuous
    
    titleLabel.adjustsFontForContentSizeCategory = true
    titleLabel.font = UIFont.preferredFont(for: .headline, weight: .semibold)
    titleLabel.maximumContentSizeCategory = .extraExtraLarge
    
    subtitleLabel.adjustsFontForContentSizeCategory = true
    subtitleLabel.font = UIFont.preferredFont(for: .caption2, weight: .regular)
    subtitleLabel.maximumContentSizeCategory = . extraLarge
    
    descriptionLabel.adjustsFontForContentSizeCategory = true
    descriptionLabel.font = UIFont.preferredFont(for: .caption2, weight: .regular)
    descriptionLabel.maximumContentSizeCategory = . extraLarge
  }
  // this function run a particular collection view cell is about to be reused for a new view
  // ex we have 10 cells but we cant show 10 cell at same time, if we can show 3 cells then when it goes out frame , uikit will reuse the same cells to perserve memory and energy
  override public func prepareForReuse() {
    super.prepareForReuse()
  }
}
