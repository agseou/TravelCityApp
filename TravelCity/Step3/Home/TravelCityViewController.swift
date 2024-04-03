//
//  ViewController.swift
//  TravelCity
//
//  Created by 은서우 on 2024/01/09.
//

import UIKit
import RxSwift
import RxCocoa

final class TravelCityViewController: UIViewController {
    
    let citylist = CityInfo.city
    
    lazy var items:BehaviorRelay<[City]>  = BehaviorRelay(value: citylist)
    
    @IBOutlet var searchBar: UISearchBar!
    
    // OUTLET
    @IBOutlet var cityCollectionView: UICollectionView!
    
    let disposeBag = DisposeBag()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerXIB()
        configureCollectionViewLayout()
        configureBind()
        
        navigationItem.title = "인기 도시"
        searchBar.searchBarStyle = .minimal
    }
}

extension TravelCityViewController {
    
    func registerXIB() {
        // CollectionCell의 등록
        let xib = UINib(nibName: TravelCity3CollectionViewCell.identifier, bundle: nil)
        cityCollectionView.register(xib, forCellWithReuseIdentifier: TravelCity3CollectionViewCell.identifier)
        // Headerl의 등록
        let xib2 = UINib(nibName: TravelCity3CollectionReusableView.identifier, bundle: nil)
        cityCollectionView.register(xib2, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TravelCity3CollectionReusableView.identifier)
    }
    
    func configureCollectionViewLayout() {
        
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
    
    func configureBind() {
        // 검색
        searchBar.rx.text
            .orEmpty
            .map { [weak self] text -> [City] in
                if text.isEmpty {
                    return self!.citylist
                } else {
                    return (self?.citylist.filter { $0.city_english_name.contains(text) || $0.city_name.contains(text)})!
                }
             }
            .bind(to: items)
            .disposed(by: disposeBag)
        
        cityCollectionView.rx.itemSelected
            .withUnretained(self)
            .bind { owner, indexPath in
                //1. 스토리보드 찾기
                let sb = UIStoryboard(name: "Detail", bundle: nil)
                //2. 뷰 컨트롤러 찾기
                let vc = sb.instantiateViewController(withIdentifier: DetailViewController.identifier) as! DetailViewController
                //3. 뷰 컨트롤러 전환 : Push - Pop
                owner.navigationController?.pushViewController(vc, animated: true)
            }
            .disposed(by: disposeBag)
        
        
        items
            .asDriver(onErrorJustReturn: [])
            .drive(cityCollectionView.rx.items(cellIdentifier: TravelCity3CollectionViewCell.identifier, cellType: TravelCity3CollectionViewCell.self)) { (row, element, cell) in
                
                cell.setCityImageView(data: element)
                cell.setCityLabel(data: element)
            }
            .disposed(by: disposeBag)
            
        
    }
}


//extension TravelCityViewController: UICollectionViewDelegateFlowLayout {
//    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TravelCity3CollectionReusableView.identifier, for: indexPath) as! TravelCity3CollectionReusableView
//        header.citySegControl.addTarget(self, action: #selector(returnSegIdx), for: .valueChanged)
//        
//        return header
//    }
//    
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: UIScreen.main.bounds.width, height: 60)
//    }
//    
//    // 1. UICollectionReusableView에서 SegmentControl의 인덱스를 불러오기
//    // 2. 불러온 인텍스를 바탕으로 필터링한 값을 배열에 부여
//    @objc
//    func returnSegIdx(_ sender: UISegmentedControl) {
//        
//        let selectedIDX = sender.selectedSegmentIndex
//        
//        print(selectedIDX)
//        
//        //Enum 쓰기로 개선!!!
//        switch selectedIDX {
//        case 0: citylist = originalList
//        case 1: citylist = originalList.filter({ City in
//            return City.domestic_travel
//        })
//        case 2: citylist = originalList.filter({ City in
//            return !City.domestic_travel
//        })
//        default:
//            citylist = originalList
//            break
//        }
//    }
//    
//}
//
