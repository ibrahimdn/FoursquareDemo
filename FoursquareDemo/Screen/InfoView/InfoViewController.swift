//
//  InfoViewController.swift
//  FoursquareDemo
//
//  Created by ibrahim doğan on 19.10.2019.
//  Copyright © 2019 ibrhmdn. All rights reserved.
//

import UIKit
import MapKit
import Kingfisher

class InfoViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var imageView: UIImageView!
    
    var latitude = Double()
    var longitude = Double()
    let annotation = MKPointAnnotation()
    var imageURL = String()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.showAnimate()
        }
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        annotation.coordinate = location
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        mapView.addAnnotation(annotation)
        print(imageURL)
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: URL(string: imageURL))
      
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first?.view?.tag == 1 {
            navigationController?.navigationBar.isHidden = false
            removeAnimate()
        }
    }
}
