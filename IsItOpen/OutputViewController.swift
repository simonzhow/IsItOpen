//
//  OutputViewController.swift
//  IsItOpen
//
//  Created by Simon Zhou on 2/26/16.
//  Copyright © 2016 Simon Zhou. All rights reserved.
//

import UIKit
import GoogleMaps

class OutputViewController: UIViewController{
    
    var locationID: String?
    
    @IBOutlet var mainOutputLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    var placesClient: GMSPlacesClient?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placesClient = GMSPlacesClient()
        mainOutputLabel.text = ""
        detailsLabel.text = ""
        
        getCurrentPlace()
    }
    
    func getCurrentPlace() {
        
        let placeID = locationID
        
        placesClient!.lookUpPlaceID(placeID!, callback: { (place: GMSPlace?, error: NSError?) -> Void in
            if let error = error {
                print("lookup place id query error: \(error.localizedDescription)")
                return
            }
            
            if let place = place {
                let openNow = place.openNowStatus
                if (openNow == GMSPlacesOpenNowStatus.Yes) {
                    self.mainOutputLabel.text = "Yes"
                } else if (openNow == GMSPlacesOpenNowStatus.No) {
                    self.mainOutputLabel.text = "No"
                } else {
                    self.mainOutputLabel.text = "Unknown"
                }
                
                self.detailsLabel.text = place.name.componentsSeparatedByString(", ").joinWithSeparator("\n")
            } else {
                print("No place details for \(placeID)")
            }
        })
        
}


override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}
}