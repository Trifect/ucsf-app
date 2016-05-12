//
//  FindingsViewController.swift
//  UCSF
//
//  Created by Kevin Nguyen on 4/16/16.
//  Copyright © 2016 Jimbus. All rights reserved.
//

import UIKit

class FindingsViewController: UIViewController, UIPopoverPresentationControllerDelegate, PassBackDelegate {
    
    @IBOutlet weak var nextButton: UIButton!

    @IBOutlet weak var findingsButton: UIButton!
    
    @IBOutlet weak var findings: UITextField!
    
    @IBOutlet weak var errorMessageField: UITextView!
    
    func chosenFinding(input: UITextField) throws -> Int {
        if input.text! == "" {
            throw dataReaderError.missingFinding
        }
        guard let findingChosen = findingsNames.indexOf(input.text!) else {
            throw dataReaderError.notFromGivenList
        }
        return findingChosen+1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Findings"
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        findingsButton.layer.cornerRadius = 5
        findingsButton.layer.borderWidth = 1
        findingsButton.layer.borderColor = UIColor(red: 0.0, green: 0.49, blue: 0.75, alpha: 1.0).CGColor
        
        nextButton.layer.cornerRadius = 5
        nextButton.layer.borderWidth = 1
        nextButton.layer.borderColor = UIColor(red: 0.0, green: 0.49, blue: 0.75, alpha: 1.0).CGColor
        
        //findings.attributedPlaceholder = NSAttributedString(string: "Findings", attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        errorMessageField.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func popOver(sender: AnyObject) {
        //self.performSegueWithIdentifier("showView4", sender: self)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showView4" {
            let destination = segue.destinationViewController as! FindingsPopoverViewController
            let controller = destination.popoverPresentationController
            destination.passBackDelegate = self
            
            // Sets the coordinates of the popover arrow so that it points to the middle of the anchor view.
            segue.destinationViewController.popoverPresentationController?.sourceRect = CGRectMake(findingsButton.frame.size.width/2, findingsButton.frame.size.height, 0, 0)
            
            if  controller != nil {
                controller?.delegate = self
            }
        }
        if (segue.identifier == "findingSegue") {
            let destination = segue.destinationViewController as! InterventionViewController
                destination.toPass = findingsNames.indexOf(findings.text!)!+1
        }
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "findingSegue" {
            var errorMessage: String = ""
            do {
                try chosenFinding(findings)
            } catch dataReaderError.missingFinding {
                errorMessage = "Please select a finding"
            } catch dataReaderError.notFromGivenList {
                errorMessage = "Please make a selection from the given list"
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
        }
        return true
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
    
    func sendString(myString: String) {
        findings.text = myString
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

}