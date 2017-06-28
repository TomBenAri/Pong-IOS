//
//  WallTableViewCell.swift
//  Pong
//
//  Created by Tom Ben Ari on 17/01/2017.
//  Copyright © 2017 Tom Ben Ari. All rights reserved.
//

import UIKit

class WallTableViewCell: UITableViewCell {

    static let identifier = "cell"
    
   
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var winByLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func configure(_ obj : Record){
    nameLabel.text = obj.userName.description
        dateLabel.text = obj.date.description
        winByLabel.text = obj.winBy.description
        
    }
}
