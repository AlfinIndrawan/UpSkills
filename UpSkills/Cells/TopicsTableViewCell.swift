import UIKit

class TopicsTableViewCell: UITableViewCell {
  @IBOutlet var topicIcon: UIImageView!
  @IBOutlet var topicLabel: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
    topicLabel.adjustsFontForContentSizeCategory = true
    topicLabel.font = UIFont.preferredFont(for: .body, weight: .bold)
    topicLabel.maximumContentSizeCategory = .extraExtraLarge
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
