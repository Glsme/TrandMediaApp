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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 44
        
        tasks = localRealm.objects(ShoppingModel.self)
        print("Realm is located at:", localRealm.configuration.fileURL!)
    }
    
    @IBAction func addButtonClicked(_ sender: UIButton) {
        print(#function)
        guard let text = shoppingTextField.text else { return }
        let task = ShoppingModel(shoppingContent: text, checking: false, like: false)
        
        try! localRealm.write {
            localRealm.add(task)
            print("Realm Succeed")
            
            tableView.reloadData()
        }
    }
    
    @IBAction func returnTextField(_ sender: UITextField) {
        print(#function)
        guard let text = shoppingTextField.text else { return }
        let task = ShoppingModel(shoppingContent: text, checking: false, like: false)
        
        try! localRealm.write {
            localRealm.add(task)
            print("Realm Succeed")
            
            tableView.reloadData()
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as! ShoppingTableViewCell
        cell.shoppingLabel.text = tasks[indexPath.row].shoppingContent
        
        return cell
    }
}
