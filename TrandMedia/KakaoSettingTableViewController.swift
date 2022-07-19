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
        
//        tableView.rowHeight = 80
    }
    
    // Header
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return SettingOption.allCases[section].sectionTitle
    }
    
    // section
    override func numberOfSections(in tableView: UITableView) -> Int {
        return SettingOption.allCases.count
    }
    
    // cell count
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingOption.allCases[section].rowTitle.count
    }
    
    // cell design & data
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
        
        cell.textLabel?.text = SettingOption.allCases[indexPath.section].rowTitle[indexPath.row]
        cell.textLabel?.font = .systemFont(ofSize: 12, weight: .regular)
        
        return cell
    }
    
    // cell height
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 40
//    }
    
}
