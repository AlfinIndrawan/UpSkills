import UIKit

class NotificationTableViewCell: UITableViewCell {

  @IBOutlet var subtitleLabel: UILabel!
  @IBOutlet var courseLogo: UIImageView!
  @IBOutlet var messageLabel: UILabel!
  @IBOutlet var titleLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
    titleLabel.adjustsFontForContentSizeCategory = true
    titleLabel.font = UIFont.preferredFont(for: .headline, weight: .bold)
    titleLabel.maximumContentSizeCategory = .extraExtraLarge
    
    subtitleLabel.adjustsFontForContentSizeCategory = true
    subtitleLabel.font = UIFont.preferredFont(for: .caption1, weight: .semibold)
    subtitleLabel.maximumContentSizeCategory = . extraLarge
    
    messageLabel.adjustsFontForContentSizeCategory = true
    messageLabel.font = UIFont.preferredFont(for: .caption1, weight: .regular)
    messageLabel.maximumContentSizeCategory = . extraLarge
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
