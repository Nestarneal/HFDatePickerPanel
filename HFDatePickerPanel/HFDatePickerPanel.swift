//
//  HFDatePickerPanel.swift
//  HFDatePickerPanel
//
//  Created by Nestarneal on 2018/05/20.
//  Copyright © 2018年 Nestarneal. All rights reserved.
//

import UIKit
import HFDatePickerTextField

@objc public protocol HFDatePickerPanelDelegate: class {
    
    func datePickerPanel(_ datePickerPanel: HFDatePickerPanel, didSelectDate date: Date)
}

public class HFDatePickerPanel: UIView {

    // MARK: - Properties
    
    private enum XIBTag {
        static let previousDate = 1
        static let nextDate = 2
        static let datePickerTextField = 3
    }
    
    private var currentDate = Date()
    
    private weak var datePickerTextField: DatePickerTextField!
    
    @IBOutlet public weak var delegate: HFDatePickerPanelDelegate?
    
    // MARK: - Actions
    
    @IBAction private func buttonPressed(_ sender: UIButton) {
        datePickerTextField.resignFirstResponder()
        
        if sender.tag == XIBTag.previousDate {
            if let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: currentDate) {
                currentDate = yesterday
                datePickerTextField.set(date: currentDate)
            }
        } else if sender.tag == XIBTag.nextDate {
            if let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: currentDate) {
                currentDate = tomorrow
                datePickerTextField.set(date: currentDate)
            }
        }
    }
    
    // MARK: - Initialization
    
    private func setUp() {
        
        // Load from Nib, instantiate it, and add it to sub view.
        let nib = UINib(nibName: "HFDatePickerPanel", bundle: Bundle(for: type(of: self)))
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.frame = bounds
        addSubview(view)
        
        // Get a weak reference to the DatePickerTextField instance.
        for subView in view.subviews {
            if subView.tag == XIBTag.datePickerTextField, let subView = subView as? DatePickerTextField {
                datePickerTextField = subView
            }
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
}

extension HFDatePickerPanel: DatePickerTextFieldDelegate {
    
    public func datePickerTextField(_ datePickerTextField: DatePickerTextField, didSelectDate date: Date) {
        currentDate = date
        
        // Inform the delegate that the date is selected.
        // Note that the date may be remaining the same date as previous one or it may be changed.
        delegate?.datePickerPanel(self, didSelectDate: date)
    }
}
