//
//  ConstrainedSubclasses.swift
//  manup
//
//  Created by Yudiz Solutions Pvt. Ltd. on 01/03/16.
//  Copyright © 2016 The App Developers. All rights reserved.
//

import UIKit


//MARK: - Constained Classes for All device support
// Bewlow all classed reduces text of button and Label according to device screen size

/**
 TextField with varying font size based on device's screen width.
 */

class WidthTextField: UITextField {
    override func awakeFromNib() {
        super.awakeFromNib()
        if let afont = font {
            font = afont.withSize(afont.pointSize * widthRatio)
        }
    }
}

/**
 TextView with varying font size based on device's screen width.
 */

class WidthTextView: UITextView {
    override func awakeFromNib() {
        super.awakeFromNib()
        if let afont = font {
            font = afont.withSize(afont.pointSize * widthRatio)
        }
    }
}

/**
 Button with varying font size based on device's screen width.
 */

class WidthButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        if let afont = titleLabel?.font {
            titleLabel?.font = afont.withSize(afont.pointSize * widthRatio)
        }
    }
}

/**
 Button with varying font size based on device's screen height.
 */

class HeightButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        if let afont = titleLabel?.font {
            titleLabel?.font = afont.withSize(afont.pointSize * heighRatio)
        }
    }
}

/**
 Label with varying font size based on device's screen width.
 */

class WidthLabel: UILabel {
    override func awakeFromNib() {
        super.awakeFromNib()
        font = font.withSize(font.pointSize * widthRatio)
    }
}

/**
 Label with varying font size based on device's screen height.
 */

class HeightLabel: UILabel {
    override func awakeFromNib() {
        super.awakeFromNib()
        font = font.withSize(font.pointSize * heighRatio)
    }
}


class WidthRoundLabel: UILabel {
    override func awakeFromNib() {
        super.awakeFromNib()
        font = font.withSize(font.pointSize * widthRatio)
        self.layer.cornerRadius = (self.bounds.size.height * widthRatio)/2
        self.layer.masksToBounds = true
    }
}

class HeightRoundLabel: UILabel {
    override func awakeFromNib() {
        super.awakeFromNib()
        font = font.withSize(font.pointSize * heighRatio)
        self.layer.cornerRadius = (self.bounds.size.height * heighRatio)/2
        self.layer.masksToBounds = true
    }
}

///Scalling button's icon as per button's size.
class IconButton: UIButton {
    override func awakeFromNib() {
        if let img = self.imageView{
            let btnsize = self.frame.size
            let imgsize = img.frame.size
            let verPad = ((btnsize.height - (imgsize.height * widthRatio)) / 2)
            self.imageEdgeInsets = UIEdgeInsetsMake(verPad, 0, verPad, 0)
            self.imageView?.contentMode = .scaleAspectFit
        }
        if let afont = titleLabel?.font {
            titleLabel?.font = afont.withSize(afont.pointSize * widthRatio)
        }
    }
}


/** This View contains collection of Horizontal and Vertical constrains.
 Who's constant value varies by size of device screen size.
 */
class ConstrainedView: UIView {
    
    // MARK: Outlets
    @IBOutlet var horizontalConstraints: [NSLayoutConstraint]?
    @IBOutlet var verticalConstraints: [NSLayoutConstraint]?
    
    // MARK: Awaken
    override func awakeFromNib() {
        super.awakeFromNib()
        constraintUpdate()
    }
    
    func constraintUpdate() {
        if let hConts = horizontalConstraints {
            for const in hConts {
                let v1 = const.constant
                let v2 = v1 * widthRatio
                const.constant = v2
            }
        }
        if let vConst = verticalConstraints {
            for const in vConst {
                let v1 = const.constant
                let v2 = v1 * heighRatio
                const.constant = v2
            }
        }
    }
}


/** This Collection view cell contains collection of Horizontal and Vertical constrains.
    That's constant value varies by size of device screen size.
*/

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblSubTitle: UILabel!
    @IBOutlet var imgView: UIImageView!
    
    @IBOutlet var horizontalConstraints: [NSLayoutConstraint]?
    @IBOutlet var verticalConstraints: [NSLayoutConstraint]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        constraintUpdate()
    }
    
    // This will update constaints and shrunk it as device screen goes lower.
    func constraintUpdate() {
        if let hConts = horizontalConstraints {
            for const in hConts {
                let v1 = const.constant
                let v2 = v1 * widthRatio
                const.constant = v2
            }
        }
        if let vConst = verticalConstraints {
            for const in vConst {
                let v1 = const.constant
                let v2 = v1 * heighRatio
                const.constant = v2
            }
        }
    }
    
}


/** This Table view cell contains collection of Horizontal and Vertical constrains.
    That's constant value varies by size of device screen size.
*/

class TableViewCell: UITableViewCell {
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblSubTitle: UILabel!
    @IBOutlet var imgView: UIImageView!
    
    @IBOutlet var horizontalConstraints: [NSLayoutConstraint]?
    @IBOutlet var verticalConstraints: [NSLayoutConstraint]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.separatorInset = UIEdgeInsets.zero
        constraintUpdate()
    }
    
    
    // This will update constaints and shrunk it as device screen goes lower.
    func constraintUpdate() {
        if let hConts = horizontalConstraints {
            for const in hConts {
                let v1 = const.constant
                let v2 = v1 * widthRatio
                const.constant = v2
            }
        }
        if let vConst = verticalConstraints {
            for const in vConst {
                let v1 = const.constant
                let v2 = v1 * heighRatio
                const.constant = v2
            }
        }
    }
}


/** Tableview Header and Footer view
 */

class TableViewHeaderFooterView: UITableViewHeaderFooterView {
    @IBOutlet var horizontalConstraints: [NSLayoutConstraint]?
    @IBOutlet var verticalConstraints: [NSLayoutConstraint]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        constraintUpdate()
    }
    
    
    // This will update constaints and shrunk it as device screen goes lower.
    func constraintUpdate() {
        if let hConts = horizontalConstraints {
            for const in hConts {
                let v1 = const.constant
                let v2 = v1 * widthRatio
                const.constant = v2
            }
        }
        if let vConst = verticalConstraints {
            for const in vConst {
                let v1 = const.constant
                let v2 = v1 * heighRatio
                const.constant = v2
            }
        }
    }

}

class RoundedImageView: UIImageView {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = (self.bounds.size.height * widthRatio) / 2
        self.layer.masksToBounds = true
    }
}

class RoundedView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = (self.bounds.size.height * widthRatio) / 2
        self.layer.masksToBounds = true
    }
}

class RoundedCollectionView: UICollectionView {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = (self.bounds.size.height * widthRatio) / 2
        self.layer.masksToBounds = true
    }
}


class RoundedButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = (self.bounds.size.height * widthRatio ) / 2
        self.layer.masksToBounds = true
    }
}

class RoundedLabel: UILabel {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = self.bounds.size.height / 2
        self.layer.masksToBounds = true
    }
}

class RoundedLabelWithWidthRatio: UILabel {
    override func awakeFromNib() {
        super.awakeFromNib()
        font = font.withSize(font.pointSize * widthRatio)
        self.layer.cornerRadius = (self.bounds.size.height * widthRatio ) / 2
        self.layer.masksToBounds = true
    }
}


