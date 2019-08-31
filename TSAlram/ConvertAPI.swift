//
//  ConvertAPI.swift
//  TSAlram
//
//  Created by HSH on 30/08/2019.
//

import Foundation
import UIKit

class ConvertAPI: XMLParserDelegate {
    
    
    
    func convert() {
        let key = "5niGkASBFcvBLt9Z93VW9rw08OXuP4pbRzL15TV6in4EhpG7Pcz7kFeHwqKgiRIN4QZbQ6lG5wkpy3UArXFrfw%3D%3D"
        let url = "http://ws.bus.go.kr/api/rest/arrive/getArrInfoByRoute?ServiceKey=\(key)"
        
        let xmlParser = XMLParser(contentsOf: URL(string: url)!)
        xmlParser!.delegate = self
        xmlParser!.parse()
        
        
        
    }
    
    // XML 파서가 시작 테그를 만나면 호출됨
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
    }
    
    // 현재 테그에 담겨있는 문자열 전달
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
    }
    
    // XML 파서가 종료 테그를 만나면 호출됨
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
    }
    
}

class BusInfo {
    
}


