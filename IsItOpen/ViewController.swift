//
//  ViewController.swift
//  IsItOpen
//
//  Created by Simon Zhou on 2/26/16.
//  Copyright © 2016 Simon Zhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var searchTextField: UITextField!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        searchTextField.resignFirstResponder()
        return true
    }


}

