//
//  ViewController.swift
//  ShoppingCartApp
//
//  Created by Vikash Kumar on 08/06/17.
//  Copyright © 2017 Vikash Kumar. All rights reserved.
//

import UIKit

class HomeViewController: ParentViewController {

    //IBOutlets
    @IBOutlet var btnSearch: UIButton!
    
    //Instance Variables
    
    //top constraint for searchOption view.
    var searchViewTopConstraint: NSLayoutConstraint!
    
    //SearchOptionView. view for showing while user tap on search button.
    var searchOptionView: SearchOptionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitalUI()
    }
    
}

//MARK:- Functions
extension HomeViewController {
    //setup initial UI while working
    func setupInitalUI() {
        navigationBarView.drawShadow()
    }

    
    //Show search option view while user tap on search button
    func showSearchOptionView() {
        searchOptionView = SearchOptionView.loadView()
        searchOptionView!.frame = CGRect(x: screenSize.width, y: 0, width: screenSize.width, height: searchOptionView!.heightConstant)
        self.view.insertSubview(searchOptionView!, belowSubview: navigationBarView)
        self.view.layoutIfNeeded()
        
        //setting autolayout constraints
        searchOptionView!.isShowing = true
        
        searchOptionView!.translatesAutoresizingMaskIntoConstraints = false
        searchViewTopConstraint = searchOptionView!.topAnchor.constraint(equalTo: navigationBarView.bottomAnchor, constant: 1)
        searchViewTopConstraint.isActive = true
        searchOptionView!.widthAnchor.constraint(equalToConstant: screenSize.width).isActive = true
        searchOptionView!.heightAnchor.constraint(equalToConstant: 100 * widthRatio).isActive = true
        searchOptionView!.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: [.curveEaseOut], animations: {
            self.view.layoutIfNeeded()
        }) { (finish) in
            self.btnSearch.isEnabled = true
        }
        
        
        
        searchOptionView?.actionBlock = { (actin, value) in
        print("func abc calling")
         
        }
        let name = "vakd"
        xyz(name: name, otherFunc:  {
            print("")
        })
    }
    
    
    func abc() {
      print("abc func calling")
    }
    
    func xyz(name: String, otherFunc: (Void)->Void) {
        print("name is : \(name)")
        
        otherFunc()
        
    }

    //hide search option view with animation.
    func hideSearchOptionView() {
        searchOptionView!.isShowing = false
        
        searchViewTopConstraint.isActive = false
        searchOptionView!.topAnchor.constraint(equalTo: navigationBarView.bottomAnchor, constant: -100).isActive = true
        
        UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: [.curveEaseIn], animations: {
            self.view.layoutIfNeeded()
        }) { (finish) in
            if finish {
                self.searchOptionView?.removeFromSuperview()
            }
            self.btnSearch.isEnabled = true
        }
    }
}

//MARK:- IBActions
extension HomeViewController {
    
    @IBAction func searchBtn_clicked(sender: UIButton) {
        sender.isEnabled = false
        if let searchView = searchOptionView, searchView.isShowing {
            hideSearchOptionView()
        } else {
            showSearchOptionView()
        }
    }
}





