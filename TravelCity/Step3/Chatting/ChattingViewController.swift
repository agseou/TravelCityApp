//
//  ChattingViewController.swift
//  TravelCity
//
//  Created by 은서우 on 2024/01/12.
//

import UIKit

class ChattingViewController: UIViewController {

    static let identifier = "ChattingViewController"
    
    var chattings: ChatRoom = ChatRoom(chatroomId: 1, chatroomImage: [User.hue.profileImage], chatroomName: "도봉 멘토방")
    
    @IBOutlet var chattingTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let xib = UINib(nibName: OtherChattingTableViewCell.identifier, bundle: nil)
        let xib2 = UINib(nibName: MyChattingTableViewCell.identifier, bundle: nil)
        chattingTableView.register(xib, forCellReuseIdentifier: OtherChattingTableViewCell.identifier)
        chattingTableView.register(xib2, forCellReuseIdentifier: MyChattingTableViewCell.identifier)
        
        
        chattingTableView.delegate = self
        chattingTableView.dataSource = self
        chattingTableView.separatorStyle = .none
        
        chattingTableView.rowHeight = UITableView.automaticDimension
        
        navigationItem.title = chattings.chatroomName
        
    }
    

}

extension ChattingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chattings.chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if chattings.chatList[indexPath.row].user == .user{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: MyChattingTableViewCell.identifier, for: indexPath) as! MyChattingTableViewCell
            
            cell.setChattingData(data: chattings, idx: indexPath.row)
            cell.selectionStyle = .none
            
            return cell
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: OtherChattingTableViewCell.identifier, for: indexPath) as! OtherChattingTableViewCell
            
            cell.setChattingData(data: chattings, idx: indexPath.row)
            cell.selectionStyle = .none
            
            return cell
        }
    }
    
    
    
    
}
