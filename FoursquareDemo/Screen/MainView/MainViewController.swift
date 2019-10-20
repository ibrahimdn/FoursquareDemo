//
//  ViewController.swift
//  FoursquareDemo
//
//  Created by ibrahim doğan on 19.10.2019.
//  Copyright © 2019 ibrhmdn. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var cityNameTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        cityNameTxt.delegate = self
        DispatchQueue.main.async {
            self.setupView()
        }
    }
    
    func setupView(){
        searchBtn.layer.cornerRadius = 8
        searchBtn.layer.masksToBounds = true
        searchBtn.backgroundColor = .searchButtonBlue
        self.view.backgroundColor = .backgroundGray
        cityNameTxt.backgroundColor = .white
    }
    
    @IBAction func searchBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "goPlaceView", sender: cityNameTxt.text)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "goPlaceView":
            if let destination = segue.destination as? PlacesViewController{
                if sender as? String == "" {
                    destination.city = "İstanbul"
                }else{
                    destination.city = sender as? String ?? "İstanbul"
                }
            }
        default: break
        }
    }
}

extension MainViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case cityNameTxt:
            let result = string.range(of: "[^1-9]", options:.regularExpression)
            if result == nil && string != ""{
                return false
            }
            return true
        default:
            return true
        }
    }
}


