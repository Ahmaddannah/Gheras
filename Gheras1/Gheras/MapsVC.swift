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
    

    var coordinatesAddressLabel = UILabel()
//    UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 900)) as! GMSMapView
    var pin = UIImageView()
    var newBtn = UIButton()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        view.backgroundColor = .orange
        let hegiht = view.frame.height
        let widht = view.frame.width
        var mapView: GMSMapView! = GMSMapView(frame: CGRect(x: 0, y: 0, width: widht, height: hegiht))
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
//        mapView.mapType = GMSMapViewType.kGMSTypeSatellite
        mapView.isMyLocationEnabled = true
        
        //Label
        coordinatesAddressLabel = UILabel(frame: CGRect(x: 10, y: 50, width: 200 , height: 80))
        coordinatesAddressLabel.textColor = .black
        coordinatesAddressLabel.numberOfLines = 4
        coordinatesAddressLabel.textAlignment = .left
        coordinatesAddressLabel.backgroundColor = .lightGray
        coordinatesAddressLabel.backgroundColor = UIColor.white.withAlphaComponent(0.7)
//        coordinatesAddressLabel
        
        //Pin
        pin = UIImageView(frame: CGRect(x: view.frame.width / 2 - pin.frame.width / 2, y: view.frame.height / 2 - pin.frame.height / 2, width: 20.0, height: 20.0))
        pin.image = UIImage(systemName: "pin")
        pin.tintColor = .purple
        
        //Add New
        newBtn.tintColor = .black
        newBtn.frame = CGRect(x: widht - widht / 4 , y: hegiht - hegiht + 40 , width: hegiht / 10, height: hegiht / 10)
        newBtn.setTitleColor(#colorLiteral(red: 0.04236891121, green: 0.6102550626, blue: 0.2603748143, alpha: 1), for: .normal)
        newBtn.backgroundColor = .green
        newBtn.titleLabel?.text = "+"
        newBtn.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        newBtn.layer.cornerRadius = newBtn.frame.width / 2
        newBtn.clipsToBounds = true
        newBtn.addTarget(self, action: #selector(goForm), for: .touchDown)
        
        //Add Subviews
        view.addSubview(mapView)
        view.addSubview(pin)
        view.addSubview(coordinatesAddressLabel)
        view.addSubview(newBtn)

    }
    
    override var prefersStatusBarHidden: Bool {

     return true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 17.0)
            
//            self.mapView.animate(to: camera)
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
        var markerLatitude = Float( coordinate.latitude )
        var markerLongitude = Float(coordinate.longitude)
        
        
        marker.title = "غرسة"
        marker.snippet = "\(markerLatitude)\n\(markerLongitude)\n المستخدم : \(Auth.auth().currentUser?.email!)"
        
        marker.icon = GMSMarker.markerImage(with: #colorLiteral(red: 0.04236891121, green: 0.6102550626, blue: 0.2603748143, alpha: 1))
        marker.map = mapView
//        marker.icon?.cgImage = UIImage(systemName: "tree")
        
        let solidBlue = GMSStrokeStyle.solidColor(#colorLiteral(red: 0.04236891121, green: 0.6102550626, blue: 0.2603748143, alpha: 1))
        let solidBlueSpan = GMSStyleSpan(style: solidBlue)
        let redYellow = GMSStrokeStyle.gradient(from: .red, to: .yellow)
        let redYellowSpan = GMSStyleSpan(style: redYellow)

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

    @objc func goForm () {
        let vc = AddNewReqVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}

