//
//  CustomBlackBG.swift
//  StarTrivia
//
//  Created by Abdullah Gebreil on 12/25/1440 AH.
//  Copyright © 1440 AH Abdullah Gebreil. All rights reserved.
//

import UIKit

class BlackBGView : UIView {
    override func awakeFromNib() {
        layer.backgroundColor = UIColor.black.withAlphaComponent(0.6).cgColor
        layer.cornerRadius = 10
    }
    
}


class BlackBGButton : UIButton {
    override func awakeFromNib() {
        layer.backgroundColor = UIColor.black.withAlphaComponent(0.6).cgColor
        layer.cornerRadius = 10
    }
    
}
