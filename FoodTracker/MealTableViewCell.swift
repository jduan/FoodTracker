//
//  MealTableViewCell.swift
//  FoodTracker
//
//  Created by Jingjing Duan on 4/25/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    // MARK: properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
