//
//  ShoppingTableViewController.swift
//  TrandMedia
//
//  Created by Seokjune Hong on 2022/07/19.
//

import UIKit
import RealmSwift

//MARK: 테이블뷰 컨트롤러
class ShoppingTableViewController: UITableViewController {
    
    @IBOutlet weak var shoppingTextField: UITextField!
    
    let localRealm = try! Realm()
    var tasks: Results<ShoppingModel>!
    
    var menuItems: [UIAction] {
        return [
            UIAction(title: "즐겨찾기순으로 정렬", image: UIImage(systemName: "star"), handler: { _ in
                self.sortLikeFirst()
            }),
            UIAction(title: "제목순으로 정렬", image: UIImage(systemName: "pencil"), handler: {_ in
                self.sortContentFirst()
            }),
            UIAction(title: "체크순으로 정렬", image: UIImage(systemName: "checkmark"), handler: {_ in
                self.sortCheckFirst()
            })
        ]
    }
    
    var menu: UIMenu {
        return UIMenu(title: "", image: nil, identifier: nil, options: [], children: menuItems)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 44
        
        tasks = localRealm.objects(ShoppingModel.self)
        print("Realm is located at:", localRealm.configuration.fileURL!)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), primaryAction: nil, menu: menu)
        self.navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    @IBAction func addButtonClicked(_ sender: UIButton) {
        print(#function)
        guard let text = shoppingTextField.text else { return }
        let task = ShoppingModel(shoppingContent: text, checking: false, like: false)
        
        try! localRealm.write {
            localRealm.add(task)
            print("Realm Succeed")
            
            self.shoppingTextField.text = nil
            tableView.reloadData()
        }
    }
    
    func sortLikeFirst() {
        tasks = localRealm.objects(ShoppingModel.self).sorted(byKeyPath: "like", ascending: false)
        tableView.reloadData()
    }
    
    func sortCheckFirst() {
        tasks = localRealm.objects(ShoppingModel.self).sorted(byKeyPath: "checking", ascending: false)
        tableView.reloadData()
    }
    
    func sortContentFirst() {
        tasks = localRealm.objects(ShoppingModel.self).sorted(byKeyPath: "shoppingContent", ascending: true)
        tableView.reloadData()
    }
    
    @IBAction func returnTextField(_ sender: UITextField) {
        print(#function)
        guard let text = shoppingTextField.text else { return }
        let task = ShoppingModel(shoppingContent: text, checking: false, like: false)
        
        try! localRealm.write {
            localRealm.add(task)
            print("Realm Succeed")
            self.shoppingTextField.text = nil

            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as! ShoppingTableViewCell
        cell.shoppingLabel.text = tasks[indexPath.row].shoppingContent
        
        cell.checkButton.tag = indexPath.row
        cell.checkButton.addTarget(self, action: #selector(checkButtonClicked(_:)), for: .touchUpInside)
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likebuttonClicked(_:)), for: .touchUpInside)
        
        let checkBox = tasks[indexPath.row].checking ? "checkmark.square.fill" : "checkmark.square"
        cell.checkButton.setImage(UIImage(systemName: checkBox), for: .normal)
        
        let star = tasks[indexPath.row].like ? "star.fill" : "star"
        cell.likeButton.setImage(UIImage(systemName: star), for: .normal)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let task = tasks?[indexPath.row] {
                try! localRealm.write {
                    localRealm.delete(task)
                    print("delete Succeed")
                }
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    @objc func checkButtonClicked(_ sender: UIButton) {
        print(#function, sender.tag)
        
        try! localRealm.write {
            tasks[sender.tag].checking = !tasks[sender.tag].checking
            
            let image = tasks[sender.tag].checking ? "checkmark.square.fill" : "checkmark.square"
            sender.setImage(UIImage(systemName: image), for: .normal)
        }
    }
    
    @objc func likebuttonClicked(_ sender: UIButton) {
        print(#function, sender.tag)
        
        try! localRealm.write {
            tasks[sender.tag].like = !tasks[sender.tag].like
            
            let image = tasks[sender.tag].like ? "star.fill" : "star"
            sender.setImage(UIImage(systemName: image), for: .normal)
        }
    }
}
