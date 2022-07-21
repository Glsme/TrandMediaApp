//
//  BucketListTableViewController.swift
//  TrandMedia
//
//  Created by Seokjune Hong on 2022/07/19.
//

import UIKit

class BucketListTableViewController: UITableViewController {
    
    static var identifier = "BucketListTableViewController"
    
    var list = ["탑건", "토르", "범죄 도시2"]
    @IBOutlet weak var userTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 80
        
        navigationItem.title = "버킷리스트"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonClicked))
        
        list.append("마녀2")
        list.append("댄스")
    }
    
    @objc func closeButtonClicked() {
        self.dismiss(animated: true)
    }
    
    @IBAction func returnUserTextField(_ sender: UITextField) {
        
        if let value = sender.text?.trimmingCharacters(in: .whitespacesAndNewlines), !value.isEmpty, (2...6).contains(value.count) {
            list.append(value)
            tableView.reloadData()
        } else {
            //토스트 메시지 띄우기
        }
         
        guard let testValue = sender.text?.trimmingCharacters(in: .whitespacesAndNewlines), !testValue.isEmpty, (2...6).contains(testValue.count) else {return}
        list.append(testValue)
        tableView.reloadData()
        
        // 중요! 데이터가 달라지는 시점에 reload
//        tableView.reloadData()
//        tableView.reloadSections(IndexSet(), with: .automatic)
//        tableView.reloadRows(at: [IndexPath(row: 0, section: 0), IndexPath(row: 1, section: 0)], with: .left)
        // reloadData 후 textField 텍스트 초기화
        sender.text = ""
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BucketListTableViewCell.identifier, for: indexPath) as! BucketListTableViewCell
        
        cell.bucketListlabel.text = list[indexPath.row]
        cell.bucketListlabel.font = .systemFont(ofSize: 18, weight: .regular)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // 우측 스와이프 디폴트 기능
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //데이터 삭제 후 테이블뷰 갱신
            list.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    
    
//    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        //
//    }
    
//    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        // 즐겨찾기, 핀고정 등
//    }
    
}
