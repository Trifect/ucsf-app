//
//  ProcedurePopoverViewController.swift
//  UCSF
//
//  Created by Robert Posada on 4/7/16.
//  Copyright © 2016 Jimbus. All rights reserved.
//

import UIKit

var procedureNames = ["Colonoscopy", "EGD"]

class ProcedurePopoverViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var procedureTableView: UITableView!
    
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
        return procedureNames.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.procedureTableView.dequeueReusableCellWithIdentifier("pCell", forIndexPath: indexPath) as! ProcedureCell
        
        cell.procedureName.text = procedureNames[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let returnString = procedureNames[indexPath.row]
        passBackDelegate.sendString(returnString)
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
