//
//  MekanlarViewController.swift
//  FoursquareDemo
//
//  Created by ibrahim doğan on 19.10.2019.
//  Copyright © 2019 ibrhmdn. All rights reserved.
//

import UIKit
import Moya

class PlacesViewController: UIViewController {

    var city = "İstanbul"
    var venues = [Venue]()
    var venuesDetail = [VenueDetailVenue]()
    let venuesProvider = MoyaProvider<VenuesNetwork>()
    var isFinish: Bool = false
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        activity.startAnimating()
        getVenues()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func getVenues(){
        venuesProvider.request(.getVenues(city: city)) { [weak self] result in
            guard self != nil else { return }
            switch result {
            case .success(let response):
                do {
                    print(try response.mapJSON())
                    let venuesdata = try! JSONDecoder().decode(Venues.self, from: response.data)
                    
                    //TO DO: Pagination
                    for venues in (venuesdata.response?.venues)!{
                        self?.venues.append(venues)
                    }
                    
                    for venue in self!.venues{
                        if venue.id == self?.venues.last?.id {
                            self?.getVenuesDetail(venuesId: venue.id!, isFinishData: true)
                        }else{
                            self?.getVenuesDetail(venuesId: venue.id!, isFinishData: false)
                        }
                    }
                } catch let error {
                    self?.showAlertController(error.localizedDescription)
                    self?.activity.stopAnimating()

                }
            case .failure(let error):
                self?.showAlertController(error.localizedDescription)
                self?.activity.stopAnimating()

            }
        }
    }
    
    func getVenuesDetail(venuesId: String,isFinishData: Bool){
         venuesProvider.request(.getVenuesDetail(venuesId: venuesId)) { [weak self] result in
             guard self != nil else { return }
             switch result {
             case .success(let response):
                 do {
                    print(try response.mapJSON())
                    let venuesData = try JSONDecoder().decode(VenueDetail.self, from: response.data)
                    self?.venuesDetail.append((venuesData.response?.venue)!)
                    if self?.venuesDetail.count == self?.venues.count {
                        self?.tableView.reloadData()
                        self?.activity.stopAnimating()
                    }
                 } catch let error {
                    self?.showAlertController(error.localizedDescription)
                    self?.activity.stopAnimating()
                 }
             case .failure(let error):
                self?.showAlertController(error.localizedDescription)
                self?.activity.stopAnimating()

             }
         }
     }
    func configureCell(_ cell: UITableViewCell, at row: Int) -> UITableViewCell {
        if let temp = cell as? PlaceTableViewCell {
            temp.foodLbl.text = venues[row].name
            temp.locationLbl.text = venues[row].location?.city
            temp.scoreLbl.text = "\(venuesDetail[row].rating ?? 8.4)"
            return temp
        }else{
            return UITableViewCell()
        }
    }
}

extension PlacesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return venues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell", for: indexPath)
        return configureCell(cell, at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "InfoViewController") as? InfoViewController {
            popOverVC.latitude = (venues[indexPath.row].location?.lat)!
            popOverVC.longitude = (venues[indexPath.row].location?.lng)!
            popOverVC.imageURL = "\(venuesDetail[indexPath.row].bestPhoto!.bestPhotoPrefix!)300x300\(venuesDetail[indexPath.row].bestPhoto!.suffix!)"
            self.addChild(popOverVC)
            popOverVC.view.frame = self.view.frame
            self.view.addSubview(popOverVC.view)
            popOverVC.didMove(toParent: self)
        }
    }
}
