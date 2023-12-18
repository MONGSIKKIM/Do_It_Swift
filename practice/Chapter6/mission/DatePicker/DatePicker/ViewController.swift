//
//  ViewController.swift
//  DatePicker
//
//  Created by 김홍식 on 12/18/23.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector : Selector = #selector(ViewController.updateTime) //함수 지정
//    let alramSelector : Selector = #selector(ViewController.alarmTime) //알람 함수 지정
    let interval = 1.0
    var count = 0
    var alarmTime : String!
    var alertFlag = false
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }


    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        let formatter_alarm = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        formatter_alarm.dateFormat = "hh:mm:aaa"
        
        lblPickerTime.text = "선택시간: " + formatter.string(from: datePickerView.date)
        alarmTime = formatter_alarm.string(from: datePickerView.date)
        
        
    }
    
    @objc func updateTime() {
//        lblCurrentTime.text = String(count)
//        count = count + 1
        let date = NSDate()
        
        let formatter = DateFormatter()
        let formatter_alarm = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        formatter_alarm.dateFormat = "hh:mm:aaa"
        
        lblCurrentTime.text = "현재시간: " + formatter.string(from: date as Date)
        let currentTime = formatter_alarm.string(for: date)
        
        if (alarmTime == currentTime) {
            if !alertFlag{
                
                let alarmAlert = UIAlertController(title: "알림", message: "설정된 시간입니다 !!!", preferredStyle: UIAlertController.Style.alert)
                let alarmAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default)
                alarmAlert.addAction(alarmAction)
                present(alarmAlert, animated: true, completion: nil)
                alertFlag = true
            }
        }
        else {
            view.backgroundColor = UIColor.white
            alertFlag = false
        }
    }
//    @objc func alarmTime() {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "hh:mm:aaa"
//        
//    }
}

