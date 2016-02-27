//
//  OutputViewController.swift
//  IsItOpen
//
//  Created by Simon Zhou on 2/26/16.
//  Copyright © 2016 Simon Zhou. All rights reserved.
//

import UIKit

class OutputViewController: UIViewController{
    
    
    var yesOrNo: Bool?
    var hours: String?
    
    @IBOutlet var mainOutputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        mainOutputLabel.text = hours
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}