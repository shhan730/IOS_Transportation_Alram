//
//  BusRemaningTimeAPI.swift
//  TSAlram
//
//  Created by HSH on 30/08/2019.
//

import Foundation
import UIKit

class BusRemaningTimeAPI: NSObject, XMLParserDelegate {
    
    var xmlParser = XMLParser()
    var currentElement: String = ""
    var firstBusRemainingTime: String = ""
    var secondBusRemainingTime: String = ""
    var busTimeInfo = [String:String]()
    
    func requestBusInfo(busStId stId:String, busRouteId routeId:String, busOrd ord:String) -> [String:String]{
        
        // OPEN API 주소
        let key = "5niGkASBFcvBLt9Z93VW9rw08OXuP4pbRzL15TV6in4EhpG7Pcz7kFeHwqKgiRIN4QZbQ6lG5wkpy3UArXFrfw%3D%3D"
        
        let url =
        "http://ws.bus.go.kr/api/rest/arrive/getArrInfoByRoute?ServiceKey=\(key)&stId=\(stId)&busRouteId=\(routeId)&ord=\(ord)"
        
        guard let xmlParser = XMLParser(contentsOf: URL(string: url)!) else { return [String:String]() }
        
        xmlParser.delegate = self;
        xmlParser.parse()
        
        return busTimeInfo
    }
    
    // XML 파서가 시작 테그를 만나면 호출됨
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        currentElement = elementName
        
        if elementName == "exps1" || elementName == "exps2"{
            firstBusRemainingTime = ""
            secondBusRemainingTime = ""
        }
        
    }
    
    // 현재 테그에 담겨있는 문자열 전달
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        if currentElement == "exps1"{
           firstBusRemainingTime = string
        }else if currentElement == "exps2"{
            secondBusRemainingTime = string
        }
        
    }
    
    // XML 파서가 종료 테그를 만나면 호출됨
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if currentElement == "exps1"{
            busTimeInfo["firstBusRemainingTime"] = firstBusRemainingTime
        }else if currentElement == "exps2"{
            busTimeInfo["secondBusRemainingTime"] = secondBusRemainingTime
        }
        
    }
    
}


