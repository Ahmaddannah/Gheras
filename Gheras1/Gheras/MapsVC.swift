//
//  ViewController.swift
//  Gheras
//
//  Created by Ahmad MacBook on 15/12/2021.
//

import UIKit
import Firebase
import GoogleMaps
//import CoreLocation


class MapsVC: UIViewController , CLLocationManagerDelegate , GMSMapViewDelegate {
    
    
    var myLocation = CLLocationManager()
    
    var mapView: GMSMapView! = GMSMapView(frame: CGRect(x: 0, y: 0, width: 500, height: 900))
    var coordinatesAddressLabel = UILabel()
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
//        myLocation.is
        
        
        //MapView
        //initializeMapView
        // myLocationButton: Enables or disables the My Location button
        // isMyLocationEnabled: Enabling Location blue dot
        mapView.delegate = self
        mapView.settings.myLocationButton = true
        mapView.isMyLocationEnabled = true

        
        //Label
        coordinatesAddressLabel = UILabel(frame: CGRect(x: 20, y: 730, width: 400, height: 80))
        coordinatesAddressLabel.textColor = .purple
        coordinatesAddressLabel.backgroundColor = .white
        

        
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
        view.addSubview(coordinatesAddressLabel)
//        view.addSubview(newBtn)
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 17.0)
            
            self.mapView.animate(to: camera)
            self.myLocation.stopUpdatingLocation()

            
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
    // MARK: - Activate my location button
       // initiate action for my location button
       func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
           return false
       }
    
    // MARK: - Add Markers
    //   long press on the map to add marker
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
        
        // initiate  marker
        let marker = GMSMarker()
        
        // setup marker position
        marker.position = coordinate
        
        // getting marker coordinates
        let markerLatitude = Float( coordinate.latitude )
        let markerLongitude = Float(coordinate.longitude)
        
        
        marker.title = "الإحداثيات"
        marker.snippet = "\(markerLatitude)\n\(markerLongitude)"
        marker.map = mapView
    }
    
   
    
    
    // MARK: - Getting Readable Address

    // detecting camera position whenever the position changed
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        let latitude = mapView.camera.target.latitude
        let longitude = mapView.camera.target.longitude
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        // take coordinates as parameter to find string output
        reverseGeocodeLocation(coordinate: location)
        
    }
    
    func reverseGeocodeLocation(coordinate: CLLocationCoordinate2D) {
        
        //1 - Creating and intiating GMSGeocoder Object to be
        
        let geocoder = GMSGeocoder()
        //2 - use geocoder to reverse geocode the coordinates
        
        geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
            
            if let address = response?.firstResult(),
                let lines = address.lines {
                
                //3 - setting coordinatesAddressLabel text to current coordinates address
                
                print(lines.joined(separator: "\n") )
                self.coordinatesAddressLabel.text = lines.joined(separator: "\n")
            }
        }
    }
    
    // MARK: - Label Design
    func settingLabelDesign(){
        coordinatesAddressLabel.layer.masksToBounds = true
        coordinatesAddressLabel.layer.cornerRadius = 30
    }

}

