//
//  XmlChangeJson.swift
//  国际化工具
//
//  Created by App005 SYNERGY on 2019/5/24.
//  Copyright © 2019 zhaojichao. All rights reserved.
//

import Foundation
class NameModel: NSObject {
    var name:String?
    var value:String?
}

@objc protocol XmlChangeJsonDelegate {
    func didFoundDictionary(dictionary:Dictionary<String, String>)
}


class XmlChangeJson: NSObject {
    let fileManager = FileManager.default
    
    weak var delegate:XmlChangeJsonDelegate?
    
    var model:NameModel?
    lazy var dictValueKey:Dictionary = Dictionary<String,String>()
    
    func transLate(xmlField:String) {
        
            let fieldPath = xmlField
            let url = URL(fileURLWithPath: fieldPath)
            do {
                dictValueKey.removeAll()
                let data = try Data(contentsOf: url)
                let parser = XMLParser(data: data)
                parser.delegate = self
                parser.parse()


            } catch {

            }
        
        
        
    }
    
    
    
    
    
}
extension XmlChangeJson:XMLParserDelegate{
    func parserDidEndDocument(_ parser: XMLParser) {
        print(dictValueKey)
        if self.delegate?.didFoundDictionary != nil {
            self.delegate!.didFoundDictionary(dictionary: dictValueKey)
        }
    }
    func parserDidStartDocument(_ parser: XMLParser) {
        print("开始解析")
    }
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        print("开始查找元素\(elementName),\(attributeDict)")
        if elementName == "string" {
            model = NameModel()
            model?.name = attributeDict["name"]
        }
    }
    
    //获取元素内容

    func parser(_ parser: XMLParser, foundCharacters string: String) {
        print("元素内容\(string)")
        model?.value = string
    }
    //查找结束标签

    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        print("开始查找结束标签元素\(elementName)")
        if let model = model {
            dictValueKey[model.name!] = model.value!
        }
    }
}
