//
//  ComparisonViewController.swift
//  Internationalization
//
//  Created by App005 SYNERGY on 2020/4/25.
//  Copyright © 2020 App005 SYNERGY. All rights reserved.
//

import Cocoa

class ComparisonViewController: NSViewController {
    @IBOutlet weak var completeTextField: NSTextField!
    @IBOutlet weak var baseTextField: NSTextField!
    @IBOutlet var textView: NSTextView!
    let simple = Simple()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    
    @IBAction func cancelSeleted(_ sender: Any) {
        dismiss(self)
    }
    @IBAction func updateAction(_ sender: Any) {
        let baseField = baseTextField.stringValue
        let completeField = completeTextField.stringValue
        guard !baseField.isEmpty , !completeField.isEmpty else {
            return
        }
        
        simple.comparisonAndSort(baseField: baseField, completeField: completeField, needaffirm: true) {[unowned self] (string)  in
            self.simple.showAlertError(string: string, needContinue: { () -> (Void) in
                self.simple.comparisonAndSort(baseField: self.baseTextField.stringValue, completeField: self.completeTextField.stringValue, needaffirm: false, returnString: nil)
            })
        }
    }
    
}
