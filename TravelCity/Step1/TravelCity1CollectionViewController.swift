//
//  TravelCity1CollectionViewController.swift
//  TravelCity
//
//  Created by 은서우 on 2024/01/09.
//

import UIKit

class TravelCity1CollectionViewController: UICollectionViewController {

    let citylist = CityInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //collectionCell의 Layout 사이즈 설정
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 20
        let cellWeight = (UIScreen.main.bounds.width - spacing * 3) / 2
        layout.itemSize = CGSize(width: cellWeight, height: cellWeight + 100)
        layout.sectionInset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        collectionView.collectionViewLayout = layout
        
    }
    
    // 1. 셀 개수
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return citylist.city.count
    }

    // 2. 셀 디자인
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TravelCity1CollectionViewCell", for: indexPath) as! TravelCity1CollectionViewCell
        let item = citylist.city[indexPath.item]
        
        cell.setCityImageView(data: item)
        cell.setCityLabel(data: item)
        
        
        return cell
    }
    

}
