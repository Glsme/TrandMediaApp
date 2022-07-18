//
//  KakaoSettingTableViewController.swift
//  TrandMedia
//
//  Created by Seokjune Hong on 2022/07/18.
//

import UIKit

class KakaoSettingTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // Header
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "header"
    }
    
    // Footer
//    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        return "footer"
//    }
    
    // section
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    // cell count
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    // cell design & data
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
        
        cell.textLabel?.text = "aaa"
        cell.textLabel?.textColor = .black
        cell.textLabel?.font = .systemFont(ofSize: 12, weight: .regular)
        
        
        return cell
    }
}
