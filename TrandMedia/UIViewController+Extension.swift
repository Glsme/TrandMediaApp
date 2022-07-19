//
//  UIViewController+Extension.swift
//  TrandMedia
//
//  Created by Seokjune Hong on 2022/07/19.
//

import UIKit

extension UIViewController {
    func setBackgroundColor() {
        view.backgroundColor = .lightGray
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "타이틀", message: "메시지", preferredStyle: .alert)
        let ok = UIAlertAction(title: "ok", style: .default)
        alert.addAction(ok)
        present(alert, animated: true)
    }
}
