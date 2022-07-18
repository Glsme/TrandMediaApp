//
//  SettingTableViewController.swift
//  TrandMedia
//
//  Created by Seokjune Hong on 2022/07/18.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    var birthDayFriends = ["A", "B", "C", "D", "E"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 섹션의 개수(옵션)
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "생일"
        } else if section == 1 {
            return "즐겨찾기"
        } else if section == 2 {
            return "친구"
        } else {
            return "섹션"
        }
    }

    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "푸터"
    }
    
    // 1. 셀의 갯수
    // ex) 카톡 100명 -> 셀 100개
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return birthDayFriends.count
        } else if section == 1 {
            return 2
        } else if section == 2 {
            return 10
        } else {
            return 0
        }
    }
    
    
    // 2. 셀의 디자인과 데이터(필수)
    // ex) 카톡 이름, 프로필 사진, 상태메세지 등
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 셀 * 100

        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
        
        if indexPath.section == 0 {
//            if indexPath.row == 0 {
//                cell.textLabel?.text = birthDayFriends[indexPath.row]
//            } else if indexPath.row == 1 {
//                cell.textLabel?.text = birthDayFriends[indexPath.row]
//            } else if indexPath.row == 2 {
//                cell.textLabel?.text = birthDayFriends[indexPath.row]
//            } else if indexPath.row == 3 {
//                cell.textLabel?.text = birthDayFriends[indexPath.row]
//            }
            
            cell.textLabel?.text = birthDayFriends[indexPath.row]
            print(indexPath.row)
            
//            cell.textLabel?.text = "셀 텍스트"
            cell.textLabel?.textColor = .blue
            cell.textLabel?.font = .boldSystemFont(ofSize: 20)
        } else if indexPath.section == 1 {
            cell.textLabel?.text = "1번 인덱스 텍스트"
            cell.textLabel?.textColor = .brown
            cell.textLabel?.font = .boldSystemFont(ofSize: 30)
        } else if indexPath.section == 2 {
            cell.textLabel?.text = "2번 인덱스 텍스트"
            cell.textLabel?.textColor = .magenta
            cell.textLabel?.font = .boldSystemFont(ofSize: 15)
        }
        
        return cell
    }
}
