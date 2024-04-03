//
//  TravelCityViewModel.swift
//  TravelCity
//
//  Created by eunseou on 4/3/24.
//

import Foundation
import RxSwift
import RxCocoa

class TravelCityViewModel {
    
    let citylist = CityInfo.city
    
    // input
    let searchText = PublishSubject<String>()
    
    // output
    lazy var items:BehaviorRelay<[City]>  = BehaviorRelay(value: citylist)
    
    let disposeBag = DisposeBag()
    
    init() {
        
        searchText
            .map { [weak self] text -> [City] in
                if text.isEmpty {
                    return self!.citylist
                } else {
                    return (self?.citylist.filter { $0.city_english_name.contains(text) || $0.city_name.contains(text)})!
                }
            }
            .bind(to: items)
            .disposed(by: disposeBag)
    }
    
}
