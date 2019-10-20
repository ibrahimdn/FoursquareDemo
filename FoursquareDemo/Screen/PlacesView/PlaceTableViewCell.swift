//
//  PlaceTableViewCell.swift
//  FoursquareDemo
//
//  Created by ibrahim doğan on 19.10.2019.
//  Copyright © 2019 ibrhmdn. All rights reserved.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {

    @IBOutlet weak var foodLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var scoreLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        foodLbl.textColor = .foodLblBlue
        locationLbl.textColor = .placeLocationLblBlack
        scoreLbl.textColor = .scoreLblGreen
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
