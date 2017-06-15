//
//  ProductDetailsVC.swift
//  ShoppingCartApp
//
//  Created by Vikash Kumar on 08/06/17.
//  Copyright © 2017 Vikash Kumar. All rights reserved.
//

import UIKit

class ProductDetailsVC: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension ProductDetailsVC: UITableViewDataSource, UITableViewDelegate  {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        
        switch indexPath.section {
        case 0:
             cell = tableView.dequeueReusableCell(withIdentifier: "imageCell")!
        default:
             cell = tableView.dequeueReusableCell(withIdentifier: "cell")!

        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 200
        default:
            return 50
        }
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        for index in 0..<tableView.numberOfRows(inSection: 0) {
            if let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0)) as? ImageTblCell {
                cell.tableViewDidScroll(tblView: tableView)
            }
        }
    }
    
}


class ImageTblCell: TableViewCell {
    @IBOutlet var imgTopSpacing: NSLayoutConstraint!
    @IBOutlet var imgBottomSpacing: NSLayoutConstraint!
    @IBOutlet var imgCenterYConstraint: NSLayoutConstraint!
    @IBOutlet var containerView: UIView!
    
    func tableViewDidScroll(tblView: UITableView) {
        print(tblView.contentOffset.y)
        if tblView.contentOffset.y >= 0 {
            containerView.clipsToBounds = true
            imgTopSpacing.constant = tblView.contentOffset.y/2
            imgBottomSpacing.constant = -tblView.contentOffset.y/2
            self.clipsToBounds = true
        } else {
            imgTopSpacing.constant = tblView.contentOffset.y
            imgBottomSpacing.constant = 0
            containerView.clipsToBounds = false
            self.clipsToBounds = false
        }
        containerView.layoutIfNeeded()

    }
}
