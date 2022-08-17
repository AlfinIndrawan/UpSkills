//
//  SectionTableViewCell.swift
//  UpSkills
//
//  Created by Alfin on 10/8/22.
//

import UIKit

class SectionTableViewCell: UITableViewCell {

  @IBOutlet var subtitleLabel: UILabel!
  @IBOutlet var courseLogo: UIImageView!
  @IBOutlet var descriptionLabel: UILabel!
  @IBOutlet var titleLabel: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
    titleLabel.adjustsFontForContentSizeCategory = true
    titleLabel.font = UIFont.preferredFont(for: .headline, weight: .bold)
    titleLabel.maximumContentSizeCategory = .extraExtraLarge
    
    subtitleLabel.adjustsFontForContentSizeCategory = true
    subtitleLabel.font = UIFont.preferredFont(for: .caption1, weight: .semibold)
    subtitleLabel.maximumContentSizeCategory = .extraLarge
    
    descriptionLabel.adjustsFontForContentSizeCategory = true
    descriptionLabel.font = UIFont.preferredFont(for: .caption1, weight: .regular)
    descriptionLabel.maximumContentSizeCategory = .extraLarge
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
