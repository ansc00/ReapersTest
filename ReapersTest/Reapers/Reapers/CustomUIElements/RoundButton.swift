//
//  RoundButton.swift
//  Test
//
//  Created by tk on 15.05.21.
//

import UIKit

class RoundButton: UIButton {

    
 override func draw(_ rect: CGRect) {
    super.draw(rect)
        // Drawing code
    
    self.layer.cornerRadius = 10
    self.clipsToBounds = true
    }
    

}
