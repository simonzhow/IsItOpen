//
//  ViewController.swift
//  IsItOpen
//
//  Created by Simon Zhou on 2/26/16.
//  Copyright © 2016 Simon Zhou. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var locations = [Location]()
    var filteredTableData = [String]()
    var resultSearchController = UISearchController()
    
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var tableView: UITableView!
    
    
    // A hotel in Saigon with an attribution.
    let placeID = "ChIJV4k8_9UodTERU5KXbkYpSYs"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //       let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        //        view.addGestureRecognizer(tap)
        
        self.searchTextField.delegate = self
        
        // Create table data
        let bCafeData = LocationData(hours: "Mon: 6:00AM - 2:00AM")
        let bPlateData = LocationData(hours: "Mon: 8:00AM - 10:00PM")
        locations.append(Location(name: "BCafe", data: bCafeData, id: "ChIJezN24o28woARcqiE5XHiRhc"))
        locations.append(Location(name: "Bruin Plate", data: bPlateData, id: "ChIJNfeKbI68woAR8DEay8-K95M"));
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Keyboard Functions
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        searchTextField.resignFirstResponder()
        return true
    }
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    // Table View Functions
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        
        cell!.textLabel!.text = locations[indexPath.row].locationName;
        
        return cell!
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "GetResult" {
            if let destination = segue.destinationViewController as? OutputViewController {
                if let index = tableView.indexPathForSelectedRow?.row {
                    destination.locationID = locations[index].locationID
                }
            }
        }
    }
    
    
    
}

