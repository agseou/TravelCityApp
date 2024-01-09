//
//  TravleCity3CollectionViewController.swift
//  TravelCity
//
//  Created by 은서우 on 2024/01/09.
//

import UIKit

class TravleCity3CollectionViewController: UICollectionViewController {
    
    let citylist = CityInfo()

    override func viewDidLoad() {
        super.viewDidLoad()

        let xib = UINib(nibName: "TravelCity3CollectionViewCell", bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: "TravelCity3CollectionViewCell")
        
        
    }

    // 1. 셀 개수
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return citylist.city.count
    }

    // 2. 셀 디자인
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TravelCity3CollectionViewCell", for: indexPath) as! TravelCity3CollectionViewCell
        let item = citylist.city[indexPath.item]
        
        cell.setCityImageView(data: item)
        cell.setCityLabel(data: item)
        
        
        return cell
    }
}
