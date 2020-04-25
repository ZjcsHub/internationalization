//
//  InsertViewController.swift
//  Internationalization
//
//  Created by App005 SYNERGY on 2020/4/24.
//  Copyright © 2020 App005 SYNERGY. All rights reserved.
//

import Cocoa

class InsertViewController: NSViewController {
    let simple = Simple()

    @IBOutlet weak var comboBox: NSComboBox!
    @IBOutlet weak var fileTextField: NSTextField!
    @IBOutlet var textView: NSTextView!
    var dataSource:[String] = ["All"]
    let allItems = [
        "捷克语":"cs",
        "丹麦语":"da",
        "德语":"de",
        "希腊语":"el",
        "英语":"en",
        "西班牙语":"es",
        "芬兰语":"fi",
        "法语":"fr",
        "希伯来语":"he",
        "匈牙利语":"hu",
        "意大利语":"it",
        "挪威语":"nb",
        "荷兰语":"nl",
        "挪威语":"nn",
        "波兰语":"pl",
        "葡萄牙语":"pt",
        "罗马尼亚语":"ro",
        "俄语":"ru",
        "斯洛伐克语":"sk",
        "塞尔维亚语":"sr",
        "瑞典语":"sv",
        "土耳其语":"tr",
        "乌克兰语":"uk",
        "简体中文":"zh-Hans",
        "繁体中文":"zh-Hant"] as NSDictionary
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        dataSource.append(contentsOf: allItems.allKeys as! [String])

        comboBox.addItems(withObjectValues: dataSource)
        
        comboBox.selectItem(at: 0)
        textView.isAutomaticQuoteSubstitutionEnabled = false
        
    }
    @IBAction func clickAction(_ sender: Any) {
        
        guard let string = comboBox.objectValueOfSelectedItem  else {
            print("字符错误")
            return
        }
        var value = "All"
        if let itemTitle = allItems.value(forKey: string as! String) {
            value = itemTitle as! String
        }
        let pathFile = fileTextField.stringValue
        let needWriteString = textView.string
        if pathFile.isEmpty || needWriteString.isEmpty  {
            print("文本为空")
            return
        }
        
        simple.addTextToFile(pathFile: pathFile, needWriteString: needWriteString, namePrefix: value )
        
    }
    @IBAction func dismisseAction(_ sender: Any) {
        dismiss(self)
    }
}
