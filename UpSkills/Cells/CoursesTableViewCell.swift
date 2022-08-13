//
//  CoursesTableViewCell.swift
//  UpSkills
//
//  Created by Alfin on 8/8/22.
//

import UIKit

class CoursesTableViewCell: UITableViewCell {
  @IBOutlet var subtitleLabel: UILabel!
  @IBOutlet var courseLogo: UIImageView!
  @IBOutlet var courseBanner: UIImageView!
  @IBOutlet var courseBackground: UIImageView!
  @IBOutlet var descriptionLabel: UILabel!
  @IBOutlet var titleLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
      layer.shadowColor = UIColor(named: "Shadow")!.cgColor
      layer.shadowOpacity = 0.5
      layer.shadowOffset = CGSize(width: 0, height: 5)
      layer.shadowRadius = 10
      layer.masksToBounds = false
      layer.cornerRadius = 30
    
    titleLabel.adjustsFontForContentSizeCategory = true
    titleLabel.font = UIFont.preferredFont(for: .title1, weight: .bold)
    titleLabel.maximumContentSizeCategory = .extraExtraLarge
    
    subtitleLabel.adjustsFontForContentSizeCategory = true
    subtitleLabel.font = UIFont.preferredFont(for: .footnote, weight: .semibold)
    subtitleLabel.maximumContentSizeCategory = . extraLarge
    
    descriptionLabel.adjustsFontForContentSizeCategory = true
    descriptionLabel.font = UIFont.preferredFont(for: .footnote, weight: .regular)
    descriptionLabel.maximumContentSizeCategory = . extraLarge
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
