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
    
    let searchController = UISearchController(searchResultsController: nil) // nil tells table view that you want it to display output at same location
    var locations = [Location]() // Array used to be filtered in the search navigation
    var filteredLocations = [Location]()
    
    var resultSearchController = UISearchController()
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //Navigation Controller
        
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.BlackTranslucent
        nav?.tintColor = UIColor.whiteColor()
        nav?.topItem?.title = "Is it Open?"
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar

        locations.append(Location(name: "Bruin Café", hours: "Mon: 6:00AM - 2:00AM", open: true, id: "ChIJezN24o28woARcqiE5XHiRhc"))
        locations.append(Location(name: "Bruin Plate", hours: "Mon: 8:00AM - 9:00AM, 1:30PM - 8:00PM", open: false, id: "ChIJNfeKbI68woAR8DEay8-K95M"))
        locations.append(Location(name: "Covel Dining", hours: "Mon: 8:00AM - 9:00PM", open: true, id: "ChIJezN24o28woARcqiE5XHiRhc"))
        locations.append(Location(name: "De Neve Dining", hours: "Mon: 8:00AM - 9:00PM", open: true, id: "ChIJNfeKbI68woAR8DEay8-K95M"))
        locations.append(Location(name: "Rendézvous", hours: "Mon: 8:00AM - 12:00AM", open: true, id: "ChIJezN24o28woARcqiE5XHiRhc"))
        locations.append(Location(name: "Café 1919", hours: "Mon: 8:00AM - 11:00PM", open: true, id: "ChIJNfeKbI68woAR8DEay8-K95M"))
    }
    
    //Keyboard Funtions
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    // Table View Functions
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredLocations = locations.filter { locations in
            return locations.locationName.lowercaseString.containsString(searchText.lowercaseString)
        }
        
        tableView.reloadData()
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1 //only 1 section that we're searching for
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.active && searchController.searchBar.text != "" {
            return filteredLocations.count
        }
        return locations.count
    
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        //table view updates to match search container
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let area: Location
        if searchController.active && searchController.searchBar.text != "" {
            area = filteredLocations[indexPath.row]
        } else {
            area = locations[indexPath.row]
        }
        cell.textLabel?.text = area.locationName
        return cell
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "GetResult" {
            if let destination = segue.destinationViewController as? OutputViewController {
                if let index = tableView.indexPathForSelectedRow?.row {
                    destination.locationID = locations[index].locationID
                    destination.isItOpen = locations[index].locationOpenStatus
                    destination.locationHours = locations[index].locationHours
                }
            }
        }
    }
    
    
    
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}

