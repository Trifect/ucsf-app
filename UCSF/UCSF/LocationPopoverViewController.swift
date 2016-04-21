//
//  LocationPopoverViewController.swift
//  UCSF
//
//  Created by Robert Posada on 4/20/16.
//  Copyright © 2016 Jimbus. All rights reserved.
//

import UIKit

var locationNames = ["Rectum", "Sigmoid", "Descending", "Tranverse", "Ascending","Cecum", "Terminal LLeum"]


class LocationPopoverViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var locationTableView: UITableView!
    
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
        return locationNames.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.locationTableView.dequeueReusableCellWithIdentifier("lCell", forIndexPath: indexPath) as! LocationCell
        
        cell.locationName.text = locationNames[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let returnString = locationNames[indexPath.row]
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
