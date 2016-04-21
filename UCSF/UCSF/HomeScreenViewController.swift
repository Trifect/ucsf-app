//
//  HomeScreenViewController.swift
//  UCSF
//
//  Created by Kevin Nguyen on 4/2/16.
//  Copyright © 2016 Jimbus. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    // MARK: properties
    
    @IBOutlet weak var startForm: UIButton!
    
    @IBOutlet weak var progressForms: UIButton!
    
    
    @IBAction func newFormButton(sender: AnyObject) {
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startForm.layer.cornerRadius = 5
        startForm.layer.borderWidth = 1
        startForm.layer.borderColor = UIColor.whiteColor().CGColor
        
        progressForms.layer.cornerRadius = 5
        progressForms.layer.borderWidth = 1
        progressForms.layer.borderColor = UIColor.whiteColor().CGColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: actions
    
}
