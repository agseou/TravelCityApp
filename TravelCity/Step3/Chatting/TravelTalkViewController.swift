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
        
        travelTalkTableView.rowHeight = UITableView.automaticDimension
        navigationItem.backButtonTitle = ""
        navigationItem.backButtonDisplayMode = .default
        navigationItem.backBarButtonItem?.tintColor = .black
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //1. 스토리보드 찾기
        let sb = UIStoryboard(name: "Chatting", bundle: nil)
        //2. 뷰 컨트롤러 찾기
        let vc = sb.instantiateViewController(withIdentifier: ChattingViewController.identifier) as! ChattingViewController
        
        //3. 데이터 넘기기
        vc.chattings = chatList[indexPath.row]
        
        //4. 뷰 컨트롤러 전환 : Push - Pop
        navigationController?.pushViewController(vc, animated: true)
        
        tableView.reloadRows(at: [indexPath], with: .fade)
    }
    
    
}
