//
//  Simple.swift
//  Internationalization
//
//  Created by App005 SYNERGY on 2019/6/1.
//  Copyright © 2019 App005 SYNERGY. All rights reserved.
//

import Foundation
import Cocoa

class Simple: NSObject {
    let fieldManager = FileManager.default
    let xmlManager = XmlChangeJson()

    var xmlActionBlock:((Dictionary<String, String>) -> ())?
    
    
    lazy var desktopField:String = {
        return self.getDesptopField() ?? ""
    }()
    // MARK: - 将文件转成xml输出
    func transLate(fieldPath:String?) {
        
        guard let fieldPath = fieldPath else { return }
        
        let flag = fieldManager.fileExists(atPath: fieldPath)
        
        guard flag == true else { return }
        
        if let dict = NSDictionary(contentsOfFile: fieldPath) {
            var string = ""
            for (key,value) in dict {
                
                string += "<string name=\"\(key)\">\(changeString(changevalue: value as! String))</string>\n"
            }
            if !string.isEmpty {
                do{
                    let fileName = desktopField + "\(getDateText()).xml"
                    try string.write(toFile:fileName , atomically: true, encoding: .utf8)
                    showAlertError(string:fileName , needContinue: nil)


                }
                catch {
                    
                    showAlertError(string:"写入文件出错" , needContinue: nil)
                    
                }
            }
        }else{
            showAlertError(string: "没有此文件", needContinue: nil)
        }
        
    }
    
    // MARK: - 比对更改的osd
    func comparisonDifferentOSD(baseField:String,completeField:String) -> String {
        let fieldPath =  baseField
        let changeFiled = completeField
        let changeFlag = fieldManager.fileExists(atPath: changeFiled)
        let flag = fieldManager.fileExists(atPath: fieldPath)
        var string = "";

        if flag && changeFlag {
            if let baseDict = NSDictionary(contentsOfFile: fieldPath),let changeDic = NSDictionary(contentsOfFile: changeFiled) {
                
                for (basekey,basevalue) in baseDict {
                    for (changekey,changevalue) in changeDic {
                        if (basekey as! String).elementsEqual(changekey as! String) && !(changevalue as! String).elementsEqual(basevalue as! String){
                            let afChangeStrong = changeString(changevalue: changevalue as! String)
                            string += "\"\(basekey)\" = \"\(afChangeStrong)\";\n"
                        }
                    }
                }
               
            }
        }else{
            showAlertError(string: "没有此文件", needContinue: nil)
        }
        
        return string
    }
   
    
    
    
    
    
    // MARK: - 将字符串中的格式替换掉
    private func changeString(changevalue:String) -> String{
        var afChangeStrong = changevalue
        afChangeStrong = afChangeStrong.replacingOccurrences(of: "\n", with: "\\n")
        afChangeStrong = afChangeStrong.replacingOccurrences(of: "\"", with: "\\\"")
        return afChangeStrong
    }
    // MARK: - 获取用户桌面路径
    private func getDesptopField() -> String? {
        guard let filePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.applicationSupportDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first else { return nil}
        
        let deskTopLocation = filePath + "/OSD"
        if fieldManager.fileExists(atPath: deskTopLocation) {
            return deskTopLocation + "/"
        }else{
            do {
                try fieldManager.createDirectory(atPath: deskTopLocation, withIntermediateDirectories: true, attributes: nil)
            }
            catch {
                print("出错")
            }
        }
        print(deskTopLocation)
        return deskTopLocation + "/"
        
    }
    // MARK: - 获取时间字符串
    private func getDateText() -> String {
        
        let dateFormatter  = DateFormatter()
        dateFormatter.dateFormat = "YYYYMMddHHmmss"
        return dateFormatter.string(from: Date())
        
    }
    
    // MARK: - 弹出错误
    func showAlertError(string:String,needContinue:(() -> (Void))?) {
        
        let alertView = NSAlert()
        alertView.messageText = "标题"
        alertView.alertStyle = .informational
        alertView.addButton(withTitle: "继续")
        alertView.addButton(withTitle: "取消")
        
        let scrollview = NSScrollView(frame: NSRect(x: 0, y: 0, width: 400, height: 100))
        scrollview.hasVerticalScroller = true
        scrollview.borderType = .noBorder
        scrollview.hasHorizontalRuler = false
        let contentSize = scrollview.contentSize
        
        let textView = NSTextView(frame: scrollview.bounds)
        textView.minSize = scrollview.contentSize
        textView.maxSize = NSSize(width: Double(MAXFLOAT), height: Double(MAXFLOAT))
        textView.string = string
        textView.textContainer?.containerSize = NSSize(width: contentSize.width, height: CGFloat(MAXFLOAT))
        textView.textContainer?.widthTracksTextView = true
        
        scrollview.documentView = textView
        alertView.accessoryView = scrollview
        
        let respont = alertView.runModal()
        if respont == NSApplication.ModalResponse.alertFirstButtonReturn, let needContinue = needContinue {
            // 继续
            needContinue()
        }
        
    }
    
    
    
}


extension Simple {
    // MARK: - 比对
    func comparisonAndSort(baseField:String,completeField:String,SortArray:Array<String>,needaffirm:Bool,returnString:((String)->())?) {
        
        if needaffirm {
           let outPutString = self.comparisonDifferentOSD(baseField: baseField, completeField: completeField)
            if let returnString = returnString {
                returnString(outPutString)
            }
            return
        }
        
        
        let fieldPath =  baseField
        let changeFiled = completeField
        let changeFlag = fieldManager.fileExists(atPath: changeFiled)
        let flag = fieldManager.fileExists(atPath: fieldPath)
        
        if flag && changeFlag {
            if let baseDict = NSDictionary(contentsOfFile: fieldPath),let changeDic = NSDictionary(contentsOfFile: changeFiled) {
                var dictionary = Dictionary<String,String>()
                for (basekey,basevalue) in baseDict {
                    var outValue = basevalue
                    for (changekey,changevalue) in changeDic {
                        if (basekey as! String).elementsEqual(changekey as! String) {
                            outValue = changevalue
                            break
                        }
                    }
                    dictionary[basekey as! String] = outValue as? String
                }
                var string = "";
                
                for name in SortArray {
                    for (key,value) in dictionary {
                        let afChangeStrong = self.changeString(changevalue: value)
                        
                        if key == name {
                            string += "\"\(key)\" = \"\(afChangeStrong)\";\n"
                            dictionary.removeValue(forKey: key)
                        }
                    }
                    
                }
                for (key,value) in dictionary {
                    var afChangeStrong = (value as NSString)
                    afChangeStrong = afChangeStrong.replacingOccurrences(of: "\n", with: "\\n") as (NSString)
                    afChangeStrong = afChangeStrong.replacingOccurrences(of: "\"", with: "\\\"") as (NSString)
                    
                    string += "\"\(key)\" = \"\(afChangeStrong)\";\n"
                    
                }
                
               
                if !string.isEmpty {
                    do{
                        let fileName = desktopField + "\(getDateText()).xml"
                        try string.write(toFile:fileName , atomically: true, encoding: .utf8)
                        showAlertError(string:fileName , needContinue: nil)
                    }
                    catch {
                        showAlertError(string:"写入文件出错" , needContinue: nil)
                    }
                }
                
            }
        }
    }
    
    // MARK: - 比对文本xml格式
    func comparisonAndSortWithXml(baseField:String,completeField:String,SortArray:Array<String>,needaffirm:Bool,returnString:((String)->())?) {
        self.xmlActionBlock = { (dictionary) in
            
            self.trabslateStringByDictionary(baseField: baseField, dictionary: dictionary, SortArray: SortArray, needaffirm: needaffirm, returnString: returnString)
        }
        xmlManager.delegate = self
        xmlManager.transLate(xmlField: completeField)
        
       
    }
    
    
    func trabslateStringByDictionary(baseField:String,dictionary:Dictionary<String, String>,SortArray:Array<String>,needaffirm:Bool,returnString:((String)->())?) {
        
        if needaffirm {
            
            let fieldPath =  baseField
            let flag = fieldManager.fileExists(atPath: fieldPath)
            var string = "";
            
            if flag {
                if let baseDict = NSDictionary(contentsOfFile: fieldPath){
                    
                    for (basekey,basevalue) in baseDict {
                        for (changekey,changevalue) in dictionary {
                            if (basekey as! String).elementsEqual(changekey ) && !(changevalue ).elementsEqual(basevalue as! String){
                                let afChangeStrong = changeString(changevalue: changevalue )
                                string += "\"\(basekey)\" = \"\(afChangeStrong)\";\n"
                            }
                        }
                    }
                    
                }
            }else{
                showAlertError(string: "没有此文件", needContinue: nil)
            }
            
            if (returnString != nil) {
                returnString!(string)
            }
            
            return
        }
        
        
        
        
        
        let fieldPath =  baseField
        let flag = fieldManager.fileExists(atPath: fieldPath)
        let changeDic = dictionary
        if flag {
            if let baseDict = NSDictionary(contentsOfFile: fieldPath){
                var dictionary = Dictionary<String,String>()
                for (basekey,basevalue) in baseDict {
                    var outValue = basevalue
                    for (changekey,changevalue) in changeDic {
                        if (basekey as! String).elementsEqual(changekey ) {
                            outValue = changevalue
                            break
                        }
                    }
                    dictionary[basekey as! String] = outValue as? String
                }
                var string = "";
                
                for name in SortArray {
                    for (key,value) in dictionary {
                        let afChangeStrong = self.changeString(changevalue: value)
                        
                        if key == name {
                            string += "\"\(key)\" = \"\(afChangeStrong)\";\n"
                            dictionary.removeValue(forKey: key)
                        }
                    }
                    
                }
                for (key,value) in dictionary {
                    var afChangeStrong = (value as NSString)
                    afChangeStrong = afChangeStrong.replacingOccurrences(of: "\n", with: "\\n") as (NSString)
                    afChangeStrong = afChangeStrong.replacingOccurrences(of: "\"", with: "\\\"") as (NSString)
                    
                    string += "\"\(key)\" = \"\(afChangeStrong)\";\n"
                    
                }
                
                
                if !string.isEmpty {
                    do{
                        let fileName = desktopField + "\(getDateText()).xml"
                        try string.write(toFile:fileName , atomically: true, encoding: .utf8)
                        showAlertError(string:fileName , needContinue: nil)
                    }
                    catch {
                        showAlertError(string:"写入文件出错" , needContinue: nil)
                    }
                }
                
            }
        }
    }
   
    
}

extension Simple :XmlChangeJsonDelegate{
    func didFoundDictionary(dictionary: Dictionary<String, String>) {
        
        if (self.xmlActionBlock != nil) {
            self.xmlActionBlock!(dictionary)
        }
        
        
    }
    
}
