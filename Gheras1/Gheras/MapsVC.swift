//
//  ViewController.swift
//  Gheras
//
//  Created by Ahmad MacBook on 15/12/2021.
//

import UIKit
import Firebase
import GoogleMaps
import CoreLocation


class MapsVC: UIViewController, CLLocationManagerDelegate {
    
    
    let myLocation = CLLocationManager()
    
    let mapView: GMSMapView = GMSMapView(frame: CGRect(x: 0, y: 0, width: 500, height: 900))
//    UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 900)) as! GMSMapView
    var pin = UIImageView()
    let newBtn = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        // Location
        myLocation.delegate = self
        myLocation.requestWhenInUseAuthorization()
        myLocation.startUpdatingLocation()

        //MapView
//        mapView.backgroundColor = .orange
//        mapView.frame = CGRect(x: 0, y: 0, width: 500, height: 900)

        
        //Pin
        pin = UIImageView(frame: CGRect(x: view.frame.width / 2 - pin.frame.width / 2, y: view.frame.height / 2 - pin.frame.height / 2, width: 20.0, height: 20.0))
        pin.image = UIImage(systemName: "pin")
        pin.tintColor = .purple
        
        //Add New
        newBtn.tintColor = .blue
        newBtn.frame = CGRect(x: 100, y: 100, width: 50, height: 50)
//        newBtn.titleLabel?.text = "+"
        pin.image = UIImage(systemName: "pin")

        
        //Add Subviews
        view.addSubview(mapView)
        view.addSubview(pin)
//        view.addSubview(newBtn)
        
        
    }

}

