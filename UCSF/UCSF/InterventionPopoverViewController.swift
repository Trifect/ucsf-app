//
//  InterventionPopoverViewController.swift
//  UCSF
//
//  Created by Robert Posada on 4/28/16.
//  Copyright © 2016 Jimbus. All rights reserved.
//

import UIKit

class InterventionPopoverViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var interventionTableView: UITableView!
    
    var passBackDelegate: PassBackDelegate2! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interventionList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.interventionTableView.dequeueReusableCellWithIdentifier("intCell", forIndexPath: indexPath) as! InterventionCell
        
        cell.interventionLabel.text = interventionList[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let returnString = interventionList[indexPath.row]
        passBackDelegate.sendString2(returnString)
        self.dismissViewControllerAnimated(false, completion: nil)
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
