//
//  MapViewController.swift
//  InterviewQ
//
//  Created by Yaxin Yuan on 2017-12-14.
//  Copyright © 2017 Yaxin Yuan. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: GMSMapView!
    

    
    var addArray: [(String, String)]?
        
    
    func initController(addArray:[(String, String)]){
        self.addArray = addArray
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let addArray = addArray else{
            return
        }
        print("camera setting")
        
        for addTuple in addArray{
            let position = CLLocationCoordinate2D(latitude: Double(addTuple.0)!, longitude: Double(addTuple.1)!)
            print("position is \(position)")
            let marker = GMSMarker(position: position)
            marker.map = mapView
        }
        let camera = GMSCameraPosition.camera(withLatitude: Double(addArray[1].0)!, longitude: Double(addArray[1].1)!, zoom: 16)
        mapView.camera = camera
    }


    


}
