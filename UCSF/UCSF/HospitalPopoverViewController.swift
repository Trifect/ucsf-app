//
//  HospitalPopoverViewController.swift
//  UCSF
//
//  Created by Kevin Nguyen on 4/2/16.
//  Copyright © 2016 Jimbus. All rights reserved.
//

import UIKit

var hospitalNames = ["SFGH", "Parnassus", "VA"]

protocol PassBackDelegate {
    func sendString(myString:String)
}

class HospitalPopoverViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: properties
    
    @IBOutlet weak var tableView: UITableView!
    
    var passBackDelegate: PassBackDelegate! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hospitalNames.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! HospitalCell
        
        cell.hospitalName.text = hospitalNames[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let returnString = hospitalNames[indexPath.row]
        passBackDelegate.sendString(returnString)
    }
    
    // MARK: actions
    
}
