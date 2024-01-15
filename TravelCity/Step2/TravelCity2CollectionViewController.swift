//
//  TravelCity2CollectionViewController.swift
//  TravelCity
//
//  Created by 은서우 on 2024/01/09.
//

import UIKit

class TravelCity2CollectionViewController: UICollectionViewController {

    let citylist = CityInfo.city
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let xib = UINib(nibName: "TravelCity2CollectionViewCell", bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: "TravelCity2CollectionViewCell")
        
        
        //collectionCell의 Layout 사이즈 설정
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 20
        let cellWeight = (UIScreen.main.bounds.width - spacing * 3) / 2
        let cellHeight = cellWeight + 100
        layout.itemSize = CGSize(width: cellWeight, height: cellHeight)
        layout.sectionInset = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 10
        collectionView.collectionViewLayout = layout
        
    }
    
    // 1. 셀 개수
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return citylist.count
    }

    // 2. 셀 디자인
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TravelCity2CollectionViewCell", for: indexPath) as! TravelCity2CollectionViewCell
        let item = citylist[indexPath.item]
        
        cell.setCityImageView(data: item)
        cell.setCityLabel(data: item)
        
        
        return cell
    }

    

}
