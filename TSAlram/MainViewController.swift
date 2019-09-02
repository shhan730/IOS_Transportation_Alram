//
//  MainViewController.swift
//  TSAlram
//
//  Created by HSH on 30/08/2019.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //stId=112000001&busRouteId=100100118&ord=23
        
        let busRemainingTimeAPI = BusRemaningTimeAPI()
        
        let busTimeInfo = busRemainingTimeAPI.requestBusInfo(busStId: "112000001", busRouteId: "100100118", busOrd: "23")
        
        print(busTimeInfo)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
