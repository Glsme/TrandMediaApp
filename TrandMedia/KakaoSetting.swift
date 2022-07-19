//
//  KakaoSetting.swift
//  TrandMedia
//
//  Created by Seokjune Hong on 2022/07/18.
//

import Foundation

// setting section
enum KakaoSetting: Int {
    case wholeSetting = 0
    case personalSetting = 1
    case etcSetting = 2
}

enum SettingOption: Int, CaseIterable {
    case total, personal, othrers
    
    var sectionTitle: String {
        switch self {
        case .total:
            return "전체 설정"
        case .personal:
            return "개인 설정"
        case .othrers:
            return "기타"
        }
        
    }
    
    var rowTitle: [String] {
        switch self {
        case .total:
            return ["공지사항", "실험실", "버전 정보"]
        case .personal:
            return ["개인/보안", "알림", "채팅", "멀티프로필"]
        case .othrers:
            return ["고객센터/도움말"]
        }
    }
}
