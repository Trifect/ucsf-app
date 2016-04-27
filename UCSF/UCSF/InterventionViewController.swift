//
//  InterventionViewController.swift
//  UCSF
//
//  Created by Robert Posada on 4/20/16.
//  Copyright © 2016 Jimbus. All rights reserved.
//

import UIKit

var interventionList = ["Biopsy","Snare Cold", "Snare Hot", "Injection Submucosa", "Injection Epi", "Injection Sclero", "Banding", "Cautery Bicap", "Cautery Argon", "Clip", "Dilation", "pH-Bravo"]

class InterventionViewController: UIViewController,UIPopoverPresentationControllerDelegate, UITableViewDataSource, UITableViewDelegate, PassBackDelegate {
    
    @IBOutlet weak var locationButton: UIButton!
    
    @IBOutlet weak var locationName: UITextField!
    
    
    @IBAction func popOver(sender: AnyObject) {
        self.performSegueWithIdentifier("showLocationView", sender: self)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int {
            return interventionList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("interventionCell", forIndexPath: indexPath) as! interventionCell
        
        cell.interventionLabel.text = interventionList[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // this deals with saving into plist from selected cell
        // let selectedRow = indexPath.row
        // let interventionName = interventionList[selectedRow]
        //WE will implement plist entry here
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showLocationView" {
            let destination = segue.destinationViewController as! LocationPopoverViewController
            let controller = destination.popoverPresentationController
            destination.passBackDelegate = self
            
            segue.destinationViewController.popoverPresentationController?.sourceRect = CGRectMake(locationButton.frame.size.width/2, 0, 0, 0)
            
            if controller != nil {
                controller?.delegate = self
            }
        }
        
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func sendString(myString: String) {
        locationName.text = myString
    }

}
