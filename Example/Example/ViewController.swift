//
//  ViewController.swift
//  Example
//
//  Created by Nestarneal on 2018/05/20.
//  Copyright © 2018年 Nestarneal. All rights reserved.
//

import UIKit
import HFDatePickerPanel

class ViewController: UIViewController {

    private var currentDate = Date()
    
    @IBOutlet weak var datePickerPanel: HFDatePickerPanel!
    
    @IBAction func toPreviousDate(_ sender: UIButton) {
        currentDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate) ?? currentDate
        datePickerPanel.setDate(currentDate)
    }
    
    @IBAction func toNextDate(_ sender: UIButton) {
        currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate) ?? currentDate
        datePickerPanel.setDate(currentDate)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePickerPanel.delegate = self
    }
}

extension ViewController: HFDatePickerPanelDelegate {
    
    func datePickerPanel(_ datePickerPanel: HFDatePickerPanel, didSelectDate date: Date) {
        print(date)
    }
}
