//
//  ViewController.swift
//  TrandMedia
//
//  Created by Seokjune Hong on 2022/07/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dateLabel2: UILabel!
    
    @IBOutlet var dateLabelCollection: [UILabel]!
    
    @IBOutlet weak var yellowViewLeadingConstant: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        format.dateFormat = "yyyy/MM/dd"
        yellowViewLeadingConstant.constant = 120
    }
    
    func configureLabelDesign() {
        // 1. Outlet Collection
        for item in dateLabelCollection {
            item.font = .boldSystemFont(ofSize: 20)
            item.textColor = .brown
        }
        
        dateLabelCollection[0].text = "First text"
        dateLabelCollection[1].text = "Second text"
        
        // 2. UILabel
        let labelArray = [dateLabel, dateLabel2]
        
        for item in labelArray {
            item?.font = .boldSystemFont(ofSize: 20)
            item?.textColor = .brown
        }
        
        dateLabel.text = "First text"
        dateLabel2.text = "Second text"
    }
    
    let format = DateFormatter()
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        
        dateLabel.text = format.string(from: sender.date)
    }
}
