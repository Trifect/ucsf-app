//
//  FindingsViewController.swift
//  UCSF
//
//  Created by Kevin Nguyen on 4/16/16.
//  Copyright © 2016 Jimbus. All rights reserved.
//

import UIKit

class FindingsViewController: UIViewController, UIPopoverPresentationControllerDelegate, PassBackDelegate {

    @IBOutlet weak var findingsButton: UIButton!
    
    @IBOutlet weak var findings: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        findingsButton.layer.cornerRadius = 5
        findingsButton.layer.borderWidth = 1
        findingsButton.layer.borderColor = UIColor.whiteColor().CGColor
        
        findings.attributedPlaceholder = NSAttributedString(string: "Findings", attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func popOver(sender: AnyObject) {
        self.performSegueWithIdentifier("showView4", sender: self)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showView4" {
            let destination = segue.destinationViewController as! FindingsPopoverViewController
            let controller = destination.popoverPresentationController
            destination.passBackDelegate = self
            
            // Sets the coordinates of the popover arrow so that it points to the middle of the anchor view.
            segue.destinationViewController.popoverPresentationController?.sourceRect = CGRectMake(findingsButton.frame.size.width/2, 0, 0, 0)
            
            if  controller != nil {
                controller?.delegate = self
            }
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
    
    func sendString(myString: String) {
        findings.text = myString
    }

}
