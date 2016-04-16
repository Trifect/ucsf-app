//
//  ExtentReachedViewController.swift
//  UCSF
//
//  Created by Robert Posada on 4/14/16.
//  Copyright © 2016 Jimbus. All rights reserved.
//

import UIKit

class ExtentReachedViewController: UIViewController, UIPopoverPresentationControllerDelegate, PassBackDelegate {
    
    @IBAction func popOver(sender: AnyObject) {
        self.performSegueWithIdentifier("showView3", sender: self)
    }
    
    @IBOutlet weak var extentReachedButton: UIButton!
    
    
    @IBOutlet weak var extentReachedText: UITextField!
    
    
    @IBOutlet weak var mySlider: UISlider!
    
    
    @IBAction func sliderChanged(sender: AnyObject) {
        sender.setValue(Float(lroundf(mySlider.value)), animated: true)
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showView3" {
            let destination = segue.destinationViewController as! ExtentReachedPopoverViewController
            let controller = destination.popoverPresentationController
            destination.passBackDelegate = self
            
            // Sets the coordinates of the popover arrow so that it points to the middle of the anchor view.
            segue.destinationViewController.popoverPresentationController?.sourceRect = CGRectMake(extentReachedButton.frame.size.width/2, extentReachedButton.frame.size.height, 0, 0)
            
            if  controller != nil {
                controller?.delegate = self
            }
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
    
    func sendString(myString: String) {
        extentReachedText.text = myString
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
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
