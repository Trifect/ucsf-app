//
//  ExtentReachedPopoverViewController.swift
//  UCSF
//
//  Created by Robert Posada on 4/14/16.
//  Copyright © 2016 Jimbus. All rights reserved.
//

import UIKit

var extentReachedList = ["Rectum", "Sigmoid", "Descending", "Transverse", "Ascending", "Cecum", "Terminal lleum"]

class ExtentReachedPopoverViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var extentReachedTableView: UITableView!
    
    var passBackDelegate: PassBackDelegate! = nil
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return extentReachedList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.extentReachedTableView.dequeueReusableCellWithIdentifier("eCell", forIndexPath: indexPath) as! ExtentReachedCell
        
        cell.extentReachedbyTrainee.text = extentReachedList[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let returnString = extentReachedList[indexPath.row]
        passBackDelegate.sendString(returnString)
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
