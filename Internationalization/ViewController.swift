//
//  ViewController.swift
//  Internationalization
//
//  Created by App005 SYNERGY on 2019/5/29.
//  Copyright © 2019 App005 SYNERGY. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
               
    }

  
    @IBAction func compariseDifference(_ sender: Any) {
        let differentVc = ComparisonViewController()
        presentAsSheet(differentVc)
    }
    
    
    @IBAction func addTitleToFile(_ sender: Any) {
        let insertVc = InsertViewController()
        presentAsSheet(insertVc)
    }
    
    
    /// 运行脚本
    func runScript() {
        // 获取需要执行的文件路径
        guard let path = Bundle.main.path(forResource: "Location", ofType: "py") else {
            return
        }
        // Swift调用终端用Process类，这里先创建一个对象
        let pro = Process()
        
        // 指定编译器
        pro.launchPath = "/bin/bash"
        

       let filePath = "/Users/app005synergy/Documents/Python/文件转换/Ios_cz.txt"
        // 设置要执行的语句，如果是有多条命令，用;隔开
        // 注意！因为命令是用""包在字符串里的，所以命令中有"时要用\"做转义
        pro.arguments =
            ["-c", "python3 \(path)","\(filePath)"]
        
        // 启动
        pro.launch()
        pro.waitUntilExit()
        
        print("脚本执行完毕")
    }
}

//"import os",
//       "isExist = os.path.exists(\(filePath))",
//       "outPutString = \"\"",
//       "if isExist == True:",
//       "   with open(\(filePath),'r') as f:",
//       "       lines = f.readlines()",
//       "       for line in lines:",
//       "           line = line.rstrip('\n')",
//       "           line = line.replace(';', '')",
//       "           numberList = line.split('=')",
//       "           if len(numberList) != 2:",
//       "               continue",
//       "           key = numberList[0].strip().strip('\"').strip(\"'\")",
//       "           value = numberList[1].strip().strip('\"').strip(\"'\")",
//       "           value = value.replace('\\N', '\\n')",
//       "           value = value.replace('\"', '\\\"')",
//       "           value = value.replace('</string>', '')",
//       "           value = value.replace('<string>', '')",
//       "           outPutString += '\"%s\' = \"%s\";\n' % (key, value)",
//       "       f.close()",
//       "print(outPutString)"
