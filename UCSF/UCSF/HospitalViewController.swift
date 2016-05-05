//
//  ViewController.swift
//  UCSF
//
//  Created by Kevin Nguyen on 3/30/16.
//  Copyright © 2016 Jimbus. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate, PassBackDelegate {
    
    // MARK: properties
    
    @IBOutlet weak var hospitalButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var traineeName: UITextField!
    @IBOutlet weak var caseID: UITextField!
    @IBOutlet weak var hospital: UITextField!
    
    @IBAction func nextButton(sender: UIButton!) {
        
        print(traineeName.text!)
        // 1 First we check to make sure we can initialize a Plist struct with our “data” plist. If we can, then we’ll perform some actions.
        if (plist != nil) {
            //2 Get the mutable version of the file. Here we are force unwrapping the file. In production you should make sure this will not error. After we get our mutable dictionary, we can add a new value to it. Using our keys, we add a value to the NSMutableDictionary.
            
            dict[traineeNameKey] = traineeName.text!
            dict[caseIDKey] = caseID.text!
            
            if hospitalNames.indexOf(hospital.text!) != nil {
                dict[hospitalKey] = hospitalNames.indexOf(hospital.text!)!+1
            } else {
                dict[hospitalKey] = 0
            }
            
            //3 Next we’re going to write the new value to the plist. We have to wrap this in our do-try-catch.
            do {
                try plist!.addValuesToPlistFile(dict)
            } catch {
                print(error)
            }
            //4 Finally, print the values of the plist file. We’re grabbing a fresh copy of the plist file so you can see that the changes have been applied.
            
            print(plist!.getValuesInPlistFile())
        }
        else {
            print("Unable to get Plist")
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Sets the radius, width, and color of the button borders.
        self.title = "Hospital"
        nextButton.layer.cornerRadius = 5
        nextButton.layer.borderWidth = 1
        nextButton.layer.borderColor = UIColor(red:0.0, green:0.49, blue:0.75, alpha:1.0).CGColor
        
        hospitalButton.layer.cornerRadius = 5
        hospitalButton.layer.borderWidth = 1
        hospitalButton.layer.borderColor = UIColor(red:0.0, green:0.49, blue:0.75, alpha:1.0).CGColor
        
        // Sets the placeholder text color to white.
        traineeName.attributedPlaceholder = NSAttributedString(string: "Trainee Name", attributes: [NSForegroundColorAttributeName: UIColor(red:0.0, green:0.49, blue:0.75, alpha:1.0)])
        
        caseID.attributedPlaceholder = NSAttributedString(string: "Case ID", attributes: [NSForegroundColorAttributeName: UIColor(red:0.0, green:0.49, blue:0.75, alpha:1.0)])
        
        hospital.attributedPlaceholder = NSAttributedString(string: "Hospital", attributes: [NSForegroundColorAttributeName: UIColor(red:0.0, green:0.49, blue:0.75, alpha:1.0)])
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        print(plist!.getValuesInPlistFile())
        
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    // MARK: actions
    
    @IBAction func popOver(sender: AnyObject) {
        self.performSegueWithIdentifier("showView", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showView" {
            let destination = segue.destinationViewController as! HospitalPopoverViewController
            let controller = destination.popoverPresentationController
            destination.passBackDelegate = self
            
            // Sets the coordinates of the popover arrow so that it points to the middle of the anchor view.
            segue.destinationViewController.popoverPresentationController?.sourceRect = CGRectMake(hospitalButton.frame.size.width/2, 0, 0, 0)
            
            if  controller != nil {
                controller?.delegate = self
            }
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
    
    
    func sendString(myString: String) {
        hospital.text = myString
    }
    
    
}

