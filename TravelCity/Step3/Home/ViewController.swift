//
//  ViewController.swift
//  TravelCity
//
//  Created by 은서우 on 2024/01/09.
//

import UIKit

class ViewController: UIViewController {
    
    let originalList = CityInfo.city
    var citylist: [City] = CityInfo.city {
        didSet { //변경된 직후 -> 프로퍼티 옵저버.
            cityCollectionView.reloadData()
        }
    }
    @IBOutlet var searchBar: UISearchBar!
    
    // OUTLET
    @IBOutlet var cityCollectionView: UICollectionView!
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // CollectionCell의 등록
        let xib = UINib(nibName: "TravelCity3CollectionViewCell", bundle: nil)
        cityCollectionView.register(xib, forCellWithReuseIdentifier: "TravelCity3CollectionViewCell")
        // Headerl의 등록
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
        
        
        navigationItem.title = "인기 도시"
        
        
        //searchBar
        searchBar.searchBarStyle = .minimal
        
    }
}


// MARK: - Extension
extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        var filterData: [City] = []
        
        if searchBar.text == "" {
            citylist = originalList
        } else {
            for item in originalList {
                if item.city_english_name.contains(searchBar.text!) || item.city_name.contains(searchBar.text!) || item.city_explain.contains(searchBar.text!) {
                    filterData.append(item)
                }
            }
            citylist = filterData
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        var filterData: [City] = []
        
        if searchBar.text == "" {
            citylist = originalList
        } else {
            for item in originalList {
                if item.city_english_name.contains(searchBar.text!) || item.city_name.contains(searchBar.text!) || item.city_explain.contains(searchBar.text!) {
                    filterData.append(item)
                }
            }
            citylist = filterData
        }
    }
}
                                
                                
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return citylist.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TravelCity3CollectionViewCell", for: indexPath) as! TravelCity3CollectionViewCell
        
        let item = citylist[indexPath.item]
        
        cell.setCityImageView(data: item)
        cell.setCityLabel(data: item)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //1. 스토리보드 찾기
        let sb = UIStoryboard(name: "Detail", bundle: nil)
        //2. 뷰 컨트롤러 찾기
        let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        //3. 뷰 컨트롤러 전환 : Push - Pop
        navigationController?.pushViewController(vc, animated: true)

    }
    
}


extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TravelCity3CollectionReusableView", for: indexPath) as! TravelCity3CollectionReusableView
        header.citySegControl.addTarget(self, action: #selector(returnSegIdx), for: .valueChanged)
        
        return header
    }
 
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 60)
    }
    
    // 1. UICollectionReusableView에서 SegmentControl의 인덱스를 불러오기
    // 2. 불러온 인텍스를 바탕으로 필터링한 값을 배열에 부여
    @objc
    func returnSegIdx(_ sender: UISegmentedControl) {
    
        let selectedIDX = sender.selectedSegmentIndex
        
        print(selectedIDX)
        
        switch selectedIDX {
        case 0: citylist = originalList
            
        case 1: citylist = originalList.filter({ City in
            return City.domestic_travel
        })
            
        case 2: citylist = originalList.filter({ City in
            return !City.domestic_travel
        })
            
        default:
            citylist = originalList
            break
        }
        
        cityCollectionView.reloadData()
    }
    
}

