//
//  ParentViewController.swift
//  Tilyn
//
//  Created by Yudiz Solutions Pvt. Ltd. on 28/12/16.
//  Copyright © 2016 Yudiz Solutions Pvt. Ltd. All rights reserved.
//

import UIKit

class ParentViewController: UIViewController {
    
    //MARK: Outlets
     @IBOutlet weak var tableView :UITableView!
     @IBOutlet weak var lblTitle  :UILabel!
     @IBOutlet weak var navigationBarView: UIView!
    
    @IBOutlet var horizontalConstraints: [NSLayoutConstraint]?
    @IBOutlet var verticalConstraints: [NSLayoutConstraint]?

    override func viewDidLoad() {
        super.viewDidLoad()
        constraintUpdate()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
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

    //MARK: Storyboard References

    //MARK: CentralActivityIndicator, CentralGrayActivityIndicator
    lazy internal var centralActivityIndicator : CustomActivityIndicatorView = {
        let image : UIImage = UIImage(named: "spinnerIcon_gray")!
        return CustomActivityIndicatorView(image: image)
    }()
    
    lazy internal var centralGrayActivityIndicator : CustomActivityIndicatorView = {
        let image : UIImage = UIImage(named: "spinnerIcon_gray")!
        let v = CustomActivityIndicatorView(image: image)
        v.backgroundColor = UIColor.clear
        return v
    }()


}

//MARK: Parent IBActions
extension ParentViewController {
    
    @IBAction func shutterButtonTapped(sender: UIButton?) {
        //shutterActionBlock()
    }
    
    @IBAction func parentBackAction(sender: UIButton?) {
       _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func parentDismissAction(sender: UIButton?) {
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK: Textfield Delegate
extension ParentViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}


extension ParentViewController {
    
    func showCentralSpinner() {
        self.view.addSubview(centralActivityIndicator)
        let xConstraint = NSLayoutConstraint(item: centralActivityIndicator, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
        let yConstraint = NSLayoutConstraint(item: centralActivityIndicator, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0)
        centralActivityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([xConstraint, yConstraint])
        centralActivityIndicator.alpha = 0.0
        view.layoutIfNeeded()
        self.view.isUserInteractionEnabled = false
        centralActivityIndicator.startAnimating()
        UIView.animate(withDuration: 0.2, animations: { () -> Void in
            self.centralActivityIndicator.alpha = 1.0
        })
    }
    func hideCentralSpinner() {
        self.view.isUserInteractionEnabled = true
        centralActivityIndicator.stopAnimating()
        UIView.animate(withDuration: 0.2, animations: { () -> Void in
            self.centralActivityIndicator.alpha = 0.0
        })
    }
    
    
    func showCentralGraySpinner() {
        centralGrayActivityIndicator.center = self.view.center
        self.view.addSubview(centralGrayActivityIndicator)
        centralGrayActivityIndicator.translatesAutoresizingMaskIntoConstraints = false
        centralGrayActivityIndicator.alpha = 0.0
        view.layoutIfNeeded()
        self.view.isUserInteractionEnabled = false
        centralGrayActivityIndicator.startAnimating()
        UIView.animate(withDuration: 0.2, animations: { () -> Void in
            self.centralGrayActivityIndicator.alpha = 1.0
        })
    }
    
    func hideCentralGraySpinner() {
        self.view.isUserInteractionEnabled = true
        centralGrayActivityIndicator.stopAnimating()
        UIView.animate(withDuration: 0.2, animations: { () -> Void in
            self.centralGrayActivityIndicator.alpha = 0.0
        })
    }

	func loadThumbImage(urlString:String) -> URL {
		if UIDevice.current.userInterfaceIdiom != .pad {
			let str = String(format: "%@?h=150&w=150", urlString)
			return URL(string: str)!
		}
		else {
			let str = String(format: "%@?h=300&w=300", urlString)
			return URL(string: str)!
		}
	}

	func loadFullImage(urlString:String) -> URL {
		let str = String(format: "%@?h=%f&w=%f",urlString,self.view.bounds.size.height,self.view.bounds.size.width)
		return URL(string: str)!
	}

}
