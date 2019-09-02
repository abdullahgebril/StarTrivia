//
//  FadeEnbledBtn.swift
//  StarTrivia
//
//  Created by Abdullah Gebreil on 12/27/1440 AH.
//  Copyright © 1440 AH Abdullah Gebreil. All rights reserved.
//

import UIKit
class FadeEnabledBtn : UIButton {
    override var isEnabled: Bool {
        didSet{
            if isEnabled {
            UIView.animate(withDuration: 0.3) {
                self.alpha = 1.0
            }
            }else {
                UIView.animate(withDuration: 0.3) {
                    self.alpha = 1.0
                
                
                
                
                
                
            }
        }
    }
}
}
