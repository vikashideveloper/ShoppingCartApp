//
//  AppColors.swift
//  BookMyHotel
//
//  Created by Vikash Kumar on 14/02/17.
//  Copyright © 2017 Vikash Kumar. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    class var commonTopBarColor : UIColor {
        return UIColor(colorLiteralRed: 6.0/255.0, green: 147.0/255.0, blue: 219.0/255.0, alpha: 1)
    }
}

extension UIColor {
    func alpha(_ value: CGFloat) -> UIColor {
        return self.withAlphaComponent(value)
    }
    
    func cgColorWithAlpha(_ value: CGFloat) -> CGColor {
        return self.alpha(value).cgColor
    }
}
