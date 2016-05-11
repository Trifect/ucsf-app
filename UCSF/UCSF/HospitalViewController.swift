//
//  ViewController.swift
//  UCSF
//
//  Created by Kevin Nguyen on 3/30/16.
//  Copyright © 2016 Jimbus. All rights reserved.
//

import UIKit

enum dataReaderError: ErrorType {
    case missingHospital
    case missingFinding
    case missingProcedure
    case notFromGivenList
}

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate, PassBackDelegate {
    
    // MARK: properties
    
    @IBOutlet weak var hospitalButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var traineeName: UITextField!
    @IBOutlet weak var caseID: UITextField!
    @IBOutlet weak var hospital: UITextField!
    @IBOutlet weak var errorMessageField: UITextView!
    
    func chosenHospital(input: UITextField) throws -> Int {
        if input.text! == "" {
            throw dataReaderError.missingHospital
        }
        guard let hospitalChoice = hospitalNames.indexOf(input.text!) else {
            throw dataReaderError.notFromGivenList
        }
        return hospitalChoice+1
    }
    
    @IBAction func nextButton(sender: UIButton!) {
        
        
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
    
    override func viewWillAppear(animated: Bool) {
        errorMessageField.hidden = true
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
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "hospital" {
            // 1 First we check to make sure we can initialize a Plist struct with our “data” plist. If we can, then we’ll perform some actions.
            if (plist != nil) {
                //2 Get the mutable version of the file. Here we are force unwrapping the file. In production you should make sure this will not error. After we get our mutable dictionary, we can add a new value to it. Using our keys, we add a value to the NSMutableDictionary.
                
                dict[traineeNameKey] = traineeName.text!
                dict[caseIDKey] = caseID.text!
                
                var errorMessage: String = ""
                
                do {
                    try dict[hospitalKey] = chosenHospital(hospital)
                } catch dataReaderError.missingHospital {
                    errorMessage = "Please select a hospital"
                } catch dataReaderError.notFromGivenList {
                    errorMessage = "Please make selections from the given list"
                } catch {
                    errorMessage = "Something went wrong!"
                }
                
                if errorMessage != "" {
                    errorMessageField.text = errorMessage
                    errorMessageField.textColor = UIColor.redColor()
                    errorMessageField.textAlignment = NSTextAlignment.Center
                    errorMessageField.hidden = false
                    return false
                }
                
                //3 Next we’re going to write the new value to the plist. We have to wrap this in our do-try-catch.
                do {
                    try plist!.addValuesToPlistFile(dict)
                } catch {
                    print(error)
                    return false
                }
                //4 Finally, print the values of the plist file. We’re grabbing a fresh copy of the plist file so you can see that the changes have been applied.
                
                print(plist!.getValuesInPlistFile())
            }
            else {
                print("Unable to get Plist")
            }
        }
        return true
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
    
    
    func sendString(myString: String) {
        hospital.text = myString
    }
    
    
}

