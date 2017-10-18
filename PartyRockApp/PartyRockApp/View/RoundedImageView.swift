//
//  RoundedImageView.swift
//  PartyRockApp
//
//  Created by dvt on 2017/10/18.
//  Copyright © 2017 dvt. All rights reserved.
//

import UIKit

class RoundedImageView: UIImageView {
    override func awakeFromNib() {
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
    }
}
