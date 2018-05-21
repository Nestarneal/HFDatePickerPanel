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

    @IBOutlet weak var datePickerPanel: HFDatePickerPanel!
    
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
