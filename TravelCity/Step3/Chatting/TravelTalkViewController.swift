//
//  TravelTalkViewController.swift
//  TravelCity
//
//  Created by 은서우 on 2024/01/12.
//

import UIKit

class TravelTalkViewController: UIViewController {

    @IBOutlet var travelTalkTableView: UITableView!
    
    let chatList = mockChatList
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let xib = UINib(nibName: TravelTalkTableViewCell.identifier, bundle: nil)
        travelTalkTableView.register(xib, forCellReuseIdentifier: TravelTalkTableViewCell.identifier)
        
        travelTalkTableView.delegate = self
        travelTalkTableView.dataSource = self
   
        travelTalkTableView.separatorStyle = .none
    }
    

}


extension TravelTalkViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TravelTalkTableViewCell.identifier) as! TravelTalkTableViewCell
        
        let row = chatList[indexPath.row]
        
        cell.setCell(data: row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
}
