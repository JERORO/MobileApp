//
//  BucketListTableViewCell.swift
//  ios-mini-app-xiongchen
//
//  Created by Jiahong Chen on 2/10/18.
//  Copyright © 2018 Jiahong Chen. All rights reserved.
//

import UIKit

class BucketListTableViewCell: UITableViewCell {

    @IBOutlet weak var bucketItemDate: UILabel!
    @IBOutlet weak var bucketItemName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
