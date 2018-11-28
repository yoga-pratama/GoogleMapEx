//
//  ViewController.swift
//  GoogleMapEx
//
//  Created by Yoga Pratama on 28/11/18.
//  Copyright © 2018 YPA. All rights reserved.
//

import UIKit
import  GoogleMaps

class ViewController: UIViewController {
    var lastCoordinate : CLLocationCoordinate2D!
    @IBOutlet fileprivate weak var mapView : GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let camera = GMSCameraPosition.camera(withLatitude: -6.21462, longitude: 106.84513, zoom: 10.0)
        
        mapView.camera = camera
        showMarker(position: camera.target)
        
        mapView.settings.myLocationButton = true
       
    }
    
    
    func showMarker(position : CLLocationCoordinate2D){
         let marker = GMSMarker()
         marker.position = position
         marker.title = "Indonesia"
         marker.snippet = "Jakarta"
         marker.map = mapView
    }
    
    func removeMarker(position : CLLocationCoordinate2D){
         let marker = GMSMarker()
        print(position)
        marker.position = position
        marker.map = mapView
        marker.map = nil
       
       
    }

}

extension ViewController : GMSMapViewDelegate{
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
         print("did tap info window")
    }
    
    func mapView(_ mapView: GMSMapView, didLongPressInfoWindowOf marker: GMSMarker) {
         print("longpress info window")
        
        marker.map = nil
    
    }
    
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        let view = UIView(frame: CGRect.init(x: 0, y: 0, width: 200, height: 70))
        
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 6
        
        let lbl1 = UILabel(frame: CGRect.init(x: 8, y: 8, width: view.frame.size.width - 16, height: 15))
        
        lbl1.text = "Hallo"
        view.addSubview(lbl1)
        
        
        let lbl2 = UILabel(frame: CGRect.init(x: lbl1.frame.origin.x, y: lbl1.frame.origin.y + lbl1.frame.size.height + 3, width: view.frame.size.width - 16, height: 15))
        
        lbl2.text = "Welcome to JAKARTA"
        lbl2.font = UIFont.systemFont(ofSize: 14, weight: .light)
        view.addSubview(lbl2)

        
        
        return view
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        
         showMarker(position: coordinate)
          
    }
    
    

    
   
    
   
    
    
}
