//
//  KakaoSettingTableViewController.swift
//  TrandMedia
//
//  Created by Seokjune Hong on 2022/07/18.
//

import UIKit

class KakaoSettingTableViewController: UITableViewController {
    
    var wholeSetting = ["공지사항", "실험실", "버전정보"]
    var personalSetting = ["개인/보안", "알림", "채팅", "멀티프로필"]
    var etcSetting = ["고객센터/도움말"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Header
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case KakaoSetting.wholeSetting.rawValue:
            return "전체 설정"
        case KakaoSetting.personalSetting.rawValue:
            return "개인 설정"
        case KakaoSetting.etcSetting.rawValue:
            return "기타"
        default:
            return "error"
        }
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
        switch section {
        case KakaoSetting.wholeSetting.rawValue:
            return wholeSetting.count
        case KakaoSetting.personalSetting.rawValue:
            return personalSetting.count
        case KakaoSetting.etcSetting.rawValue:
            return etcSetting.count
        default:
            return 0
        }
    }
    
    // cell design & data
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
        
        switch indexPath.section {
        case KakaoSetting.wholeSetting.rawValue:
            cell.textLabel?.text = wholeSetting[indexPath.row]
        case KakaoSetting.personalSetting.rawValue:
            cell.textLabel?.text = personalSetting[indexPath.row]
        case KakaoSetting.etcSetting.rawValue:
            cell.textLabel?.text = etcSetting[indexPath.row]
        default:
            break
        }
        
        return cell
    }
}
