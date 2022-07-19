//
//  ShoppingTableViewController.swift
//  TrandMedia
//
//  Created by Seokjune Hong on 2022/07/19.
//

import UIKit

class ShoppingTableViewController: UITableViewController {
    
    var shoppingList = ["그립톡 구매하기", "사이다 구매", "아이패드 케이스 최저가 알아보기", "양말"]
    
    @IBOutlet weak var shoppingTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 44
    }
    
    @IBAction func returnTextField(_ sender: UITextField) {
        shoppingList.append(shoppingTextField.text!)
        tableView.reloadData()
        shoppingTextField.text = ""
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as! ShoppingTableViewCell
        cell.shoppingLabel.text = shoppingList[indexPath.row]
        cell.shoppingLabel.font = .systemFont(ofSize: 12, weight: .regular)
        
        return cell
    }
}
