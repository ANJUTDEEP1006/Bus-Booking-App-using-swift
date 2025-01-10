//
//  busDetailsTableViewCell.swift
//  Lava Bus
//
//  Created by vishnu krishnan on 12/10/24.
//

import UIKit

class busDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var busName: UILabel!
    @IBOutlet weak var busFair: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
