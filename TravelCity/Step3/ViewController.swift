//
//  ViewController.swift
//  TravelCity
//
//  Created by 은서우 on 2024/01/09.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let citylist = CityInfo()
    
    // CollectionView Setting
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return citylist.city.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TravelCity3CollectionViewCell", for: indexPath) as! TravelCity3CollectionViewCell
        let item = citylist.city[indexPath.item]
        
        cell.setCityImageView(data: item)
        cell.setCityLabel(data: item)
                
        return cell
    }
    
    //  Header<-CollectionView Setting
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TravelCity3CollectionReusableView", for: indexPath) as! TravelCity3CollectionReusableView
        header.cityFilterSegmentedControl.addTarget(self, action: #selector(returnSegIdx), for: .valueChanged)
        // 인덱스를 프린트할 수 있다
        // 인덱스를 collectionview에 넘겨주는 방법?
        
        return header
    }
    
    // UICollectionReusableView에서 SegmentControl의 인덱스를 불러오기
    @objc
    func returnSegIdx(_ sender: UISegmentedControl){
    
        let Idx = sender.selectedSegmentIndex
        
        print(Idx)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 120)
    }
    
    // OUTLET
    @IBOutlet var cityCollectionView: UICollectionView!
    
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let xib = UINib(nibName: "TravelCity3CollectionViewCell", bundle: nil)
        cityCollectionView.register(xib, forCellWithReuseIdentifier: "TravelCity3CollectionViewCell")
        let xib2 = UINib(nibName: "TravelCity3CollectionReusableView", bundle: nil)
        cityCollectionView.register(xib2, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TravelCity3CollectionReusableView")
        
        cityCollectionView.dataSource = self
        cityCollectionView.delegate = self
        
        
        
        //collectionCell의 Layout 사이즈 설정
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 20
        let cellWeight = (UIScreen.main.bounds.width - spacing * 3) / 2
        let cellHeight = cellWeight + 100
        layout.itemSize = CGSize(width: cellWeight, height: cellHeight)
        layout.sectionInset = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 10
        cityCollectionView.collectionViewLayout = layout
        
    }
    
    

}

