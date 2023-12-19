//
//  ViewController.swift
//  Map
//
//  Created by 김홍식 on 12/20/23.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet var myMap: MKMapView!
    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet var lblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblLocationInfo1.text=""
        lblLocationInfo2.text=""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        myMap.showsUserLocation=true
    }

    func goLocation(latitudeValue: CLLocationDegrees,
                    longitudeValue : CLLocationDegrees, delta span : Double) -> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        myMap.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span :Double, title strTitle: String, subtitile strSubtitle: String){
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {(placemarks, error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address:String = country!
            if pm!.locality != nil {
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = address
        })
        
        locationManager.stopUpdatingLocation()
    }
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            //현재위치
            self.lblLocationInfo1.text = ""
            self.lblLocationInfo2.text = ""
            locationManager.startUpdatingLocation()
        } else if sender.selectedSegmentIndex == 1 {
            //성균관대학교
            setAnnotation(latitudeValue: 37.29370, longitudeValue: 126.9743, delta: 1, title: "성균관대학교", subtitile: "경기도 수원시 장안구 서부로 2066")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "성균관대학교 자연과학캠퍼스"
        } else if sender.selectedSegmentIndex == 2 {
            //이지스리퍼블리싱
            setAnnotation(latitudeValue: 37.556876, longitudeValue: 126.714066, delta: 0.1, title: "이지스퍼블리싱", subtitile: "서울시 마포구 잔다리로 109 이지스 빌딩")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "이지스퍼블리싱 출판사"
        } else if sender.selectedSegmentIndex == 3 {
            //이지스리퍼블리싱
            setAnnotation(latitudeValue: 36.3039996, longitudeValue: 127.5608993, delta: 0.01, title: "우리집", subtitile: "충청북도 옥천군 가화 3길 18")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "가화현대 아파트"
        }
        
    }
    
}

