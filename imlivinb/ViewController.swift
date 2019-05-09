//
//  ViewController.swift
//  imlivinb
//
//  Created by Alex Jeffers on 4/7/18.
//  Copyright © 2018 asapkent. All rights reserved.
//


import UIKit
import MapKit
class ViewController: UIViewController {
    
    @IBOutlet weak var shopButton: UIButton!
    @IBOutlet weak var gramButton: UIButton!
    @IBOutlet weak var locationButton: UIButton!
    
    @IBAction func locationButtonPressed(_ sender: Any) {
     getLocation()
    }
    
    
    @IBAction func shopButtonWasPressed(_ sender: Any) {
      launchWebSite()
        }
    
    @IBAction func instaGramButtonWasPressed(_ sender: Any) {
      launchInstagram()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
          addShadowToButtons()
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func addShadowToButtons() {
        shopButton.layer.shadowColor = UIColor.black.cgColor
        shopButton.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        shopButton.layer.masksToBounds = false
        shopButton.layer.shadowRadius = 2.0
        shopButton.layer.shadowOpacity = 0.5
        shopButton.layer.cornerRadius = shopButton.frame.width / 14
        shopButton.layer.borderColor = UIColor.gray.cgColor
        shopButton.layer.borderWidth = 2.0
        
        

        gramButton.layer.shadowColor = UIColor.black.cgColor
        gramButton.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        gramButton.layer.masksToBounds = false
        gramButton.layer.shadowRadius = 2.0
        gramButton.layer.shadowOpacity = 0.5
        gramButton.layer.cornerRadius = gramButton.frame.width / 14
        gramButton.layer.borderColor = UIColor.gray.cgColor
        gramButton.layer.borderWidth = 2.0
        
        
        
        
        
        locationButton.layer.shadowColor = UIColor.black.cgColor
        locationButton.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        locationButton.layer.masksToBounds = false
        locationButton.layer.shadowRadius = 2.0
        locationButton.layer.shadowOpacity = 0.5
        locationButton.layer.cornerRadius = shopButton.frame.width / 14
        locationButton.layer.borderColor = UIColor.gray.cgColor
        locationButton.layer.borderWidth = 2.0
    
    }

    func launchInstagram() {
        let screenName =  "imlivinb"
        let appURL = NSURL(string: "instagram://user?screen_name=\(screenName)")!
        let webURL = NSURL(string: "https://www.instagram.com/\(screenName)")!
        
        if UIApplication.shared.canOpenURL(appURL as URL) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(appURL as URL, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(appURL as URL)
            }
        } else {
            //redirect to safari because the user doesn't have Instagram
            if #available (iOS 10.0, *) {
                UIApplication.shared.open(webURL as URL , options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(webURL as URL)
            }
        }
    }

  
    func launchWebSite() {
         UIApplication.shared.open(URL(string:"https://www.imlivinbshop.com/")! as URL, options: [:], completionHandler: nil)
    }
  
    func getLocation() {
        
        let latitude:CLLocationDegrees = 35.203841
        let longitude:CLLocationDegrees = -80.804427
        
        let regionDistance:CLLocationDistance = 1000;
        let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placeMark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark:placeMark)
        
        mapItem.name = "3010 Monroe Rd #103, Charlotte, NC 28205"
        
        mapItem.openInMaps(launchOptions: options)
        
    }
    
}

