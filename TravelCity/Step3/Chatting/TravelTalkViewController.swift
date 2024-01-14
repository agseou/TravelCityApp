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
    var filterList: [ChatRoom] = []
    
    var searchKeyWord: String = ""
    
    @IBOutlet var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.placeholder = "친구이름을 검색해보세요"
        
        searchBar.searchBarStyle = .minimal
        
        
        let xib = UINib(nibName: TravelTalkTableViewCell.identifier, bundle: nil)
        travelTalkTableView.register(xib, forCellReuseIdentifier: TravelTalkTableViewCell.identifier)
        
        filterList = chatList
        
        travelTalkTableView.delegate = self
        travelTalkTableView.dataSource = self
   
        travelTalkTableView.separatorStyle = .none
        
        travelTalkTableView.rowHeight = UITableView.automaticDimension
        
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()

    }

}

extension TravelTalkViewController: UISearchBarDelegate {
        
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text, !text.isEmpty {
            searchKeyWord = text
            print("\(searchKeyWord)가 입력")
       
        
        filterList = chatList.filter({ ChatRoom in
            return ChatRoom.chatList.contains { Chat in
                return Chat.user.rawValue == searchKeyWord
            }
        })

        print(filterList)
        
        } else {
            filterList = chatList
        }
        travelTalkTableView.reloadData()
        view.endEditing(true)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.text = ""
    }
}


extension TravelTalkViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TravelTalkTableViewCell.identifier) as! TravelTalkTableViewCell
        
        let row = filterList[indexPath.row]
        
        cell.setCell(data: row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //1. 스토리보드 찾기
        let sb = UIStoryboard(name: "Chatting", bundle: nil)
        //2. 뷰 컨트롤러 찾기
        let vc = sb.instantiateViewController(withIdentifier: ChattingViewController.identifier) as! ChattingViewController
        
        //3. 데이터 넘기기
        vc.chattings = filterList[indexPath.row]
        
        //4. 뷰 컨트롤러 전환 : Push - Pop
        navigationController?.pushViewController(vc, animated: true)
       
        tableView.reloadRows(at: [indexPath], with: .fade)
    }
    
    
}
