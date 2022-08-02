//
//  BucketListTableViewController.swift
//  TrandMedia
//
//  Created by Seokjune Hong on 2022/07/19.
//

import UIKit

struct Todo {
    var title: String
    var done: Bool
}

class BucketListTableViewController: UITableViewController {
    
    static var identifier = "BucketListTableViewController"
    
    var textPlaceHolder = ""
    
    // List 프로퍼티가 추가, 삭제 등 변경되고 나서 테이블 뷰를 항상 갱신!
    var list = [Todo(title: "범죄도시2", done: false), Todo(title: "탑건", done: false)] {
        didSet {
            tableView.reloadData()
            print("list 변경됨 \(oldValue) -> \(list)")
        }
    }
    
    @IBOutlet weak var userTextField: UITextField! {
        didSet {
            userTextField.font = .boldSystemFont(ofSize: 22)
            userTextField.textColor = .blue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userTextField.placeholder = "\(textPlaceHolder)를 입력해보세요"
        
        tableView.rowHeight = 80
        
        navigationItem.title = "버킷리스트"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonClicked))
    }
    
    @objc func closeButtonClicked() {
        self.dismiss(animated: true)
    }
    
    @IBAction func returnUserTextField(_ sender: UITextField) {
        
        //        if let value = sender.text?.trimmingCharacters(in: .whitespacesAndNewlines), !value.isEmpty, (2...6).contains(value.count) {
        //            list.append(value)
        //            tableView.reloadData()
        //        } else {
        //            //토스트 메시지 띄우기
        //        }
        //
        //        guard let testValue = sender.text?.trimmingCharacters(in: .whitespacesAndNewlines), !testValue.isEmpty, (2...6).contains(testValue.count) else {return}
        //        list.append(testValue)
        //        tableView.reloadData()
        
        // 중요! 데이터가 달라지는 시점에 reload
        //        tableView.reloadData()
        //        tableView.reloadSections(IndexSet(), with: .automatic)
        //        tableView.reloadRows(at: [IndexPath(row: 0, section: 0), IndexPath(row: 1, section: 0)], with: .left)
        // reloadData 후 textField 텍스트 초기화
        
        
        
        // test
        list.append(Todo(title: sender.text!, done: false))
        //        tableView.reloadData()
        sender.text = ""
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BucketListTableViewCell.identifier, for: indexPath) as! BucketListTableViewCell
        
        cell.bucketListlabel.text = list[indexPath.row].title
        cell.bucketListlabel.font = .systemFont(ofSize: 18, weight: .regular)
        
        cell.checkBoxButton.tag = indexPath.row
        cell.checkBoxButton.addTarget(self, action: #selector(checkboxButtonClicked), for: .touchUpInside)
        
        let value = list[indexPath.row].done ? "checkmark.square.fill" : "checkmark.square"
        cell.checkBoxButton.setImage(UIImage(systemName: value), for: .normal)
        
        return cell
    }
    
    @objc func checkboxButtonClicked(sender: UIButton) {
        print(sender.tag, list[sender.tag].done)
        
        // 배열 인덱스를 찾아서 done을 바꿔야한다. 그리고 테이블뷰를 갱신
        if list[sender.tag].done {
            sender.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            list[sender.tag].done = false
        } else {
            sender.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            list[sender.tag].done = true
        }
        //        list[sender.tag].done = !list[sender.tag].done
        
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
        
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
            //            tableView.reloadData()
        }
    }
    
    
    
    //    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    //        //
    //    }
    
    //    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    //        // 즐겨찾기, 핀고정 등
    //    }
    
}
