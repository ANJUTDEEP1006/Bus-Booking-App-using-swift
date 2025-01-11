//
//  UserLocMapUIViewController.swift
//  Lava Bus
//
//  Created by vishnu krishnan on 12/10/24.
//

import UIKit
import MapKit

class UserLocMapUIViewController: UIViewController {
    let annotation = MKPointAnnotation()
    @IBOutlet weak var mapView: MKMapView!

    @IBOutlet weak var cityNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        annotation.coordinate = CLLocationCoordinate2D(latitude: 8.734150, longitude: 76.725502)
        mapView.addAnnotation(annotation)
    }
    

    
}
