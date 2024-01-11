//
//  DetailViewController.swift
//  TravelCity
//
//  Created by 은서우 on 2024/01/11.
//

import UIKit

class DetailViewController: UIViewController {

    let travelList = TravelInfo()
    
    @IBOutlet var cityDetailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityDetailTableView.delegate = self
        cityDetailTableView.dataSource = self
        
        let xib = UINib(nibName: DetailTableViewCell.identifier,
                        bundle: nil)
        cityDetailTableView.register(xib, forCellReuseIdentifier: DetailTableViewCell.identifier)
        let xib2 = UINib(nibName: ADTableViewCell.identifier,
                         bundle: nil)
        cityDetailTableView.register(xib2, forCellReuseIdentifier: ADTableViewCell.identifier)
        
        
        
    }
}


extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelList.travel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row.isMultiple(of: 5) { //2의 배수일때!
            let cell = tableView.dequeueReusableCell(withIdentifier:  ADTableViewCell.identifier, for: indexPath) as! ADTableViewCell
            
             return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as! DetailTableViewCell
            
            let item = travelList.travel[indexPath.row]
            
            cell.setDataCell(data: item)
            
            return cell
        }
        
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
    
    
}
