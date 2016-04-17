//
//  FindingsPopoverViewController.swift
//  UCSF
//
//  Created by Kevin Nguyen on 4/16/16.
//  Copyright © 2016 Jimbus. All rights reserved.
//

import UIKit

var findingsNames = ["Normal", "Polyp - sessile", "Polyp - pedunculated", "Mass", "Ulcer", "Bleeding", "Varices", "Inflammation"]

class FindingsPopoverViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var findingsTableView: UITableView!
    
    var passBackDelegate: PassBackDelegate! = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return findingsNames.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.findingsTableView.dequeueReusableCellWithIdentifier("fCell", forIndexPath: indexPath) as! FindingsCell
        cell.findingsName.text = findingsNames[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let returnString = findingsNames[indexPath.row]
        passBackDelegate.sendString(returnString)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
