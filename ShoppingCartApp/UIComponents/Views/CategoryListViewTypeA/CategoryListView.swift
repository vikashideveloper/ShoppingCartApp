//
//  CategoryListView.swift
//  ShoppingCartApp
//
//  Created by Vikash Kumar on 15/06/17.
//  Copyright © 2017 Vikash Kumar. All rights reserved.
//

import UIKit

class CategoryListView: UIView {
    @IBOutlet var collView: UICollectionView!
    var categories = [ProductCategory]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.registerCollectionViewCell()
    }
    
    func registerCollectionViewCell() {
        let nib = UINib(nibName: "SearchOptionCollViewCell", bundle: Bundle(for: CategoryListView.self))
        collView.register(nib, forCellWithReuseIdentifier: "categoryCell")
    }

}


//MARK: CollectionView DataSource and Delegate
extension CategoryListView : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
}


class HorizontalCategoryView: CategoryListView {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
