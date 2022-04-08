//
//  PostsTableViewCell.swift
//  IOS-Swift-Api-MVC-Example
//
//  Created by apple on 09/04/22.
//

import UIKit

class PostsTableViewCell: UITableViewCell {

    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
