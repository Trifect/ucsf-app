//
//  ProcedureViewController.swift
//  UCSF
//
//  Created by Robert Posada on 4/7/16.
//  Copyright © 2016 Jimbus. All rights reserved.
//

import UIKit

class ProcedureViewController: UIViewController, UIPopoverPresentationControllerDelegate, PassBackDelegate {
    
    @IBOutlet weak var procedureButton: UIButton!
    
    @IBOutlet weak var errorMessageField: UITextView!
    
    func chosenProcedure(input: UITextField) throws -> Int {
        if input.text! == "" {
            throw dataReaderError.missingProcedure
        }
        guard let procedureChoice = procedureNames.indexOf(input.text!) else {
            throw dataReaderError.notFromGivenList
        }
        return procedureChoice+1
    }

    @IBAction func nextButton(sender: AnyObject) {
        if(procedureNames.indexOf(procedureName.text!) == 0) {
            //performSegueWithIdentifier("colonoscopySegue", sender: self)
            shouldPerformSegueWithIdentifier("colonoscopySegue", sender: self)
        }
        else {
           // performSegueWithIdentifier("EGDSegue", sender: self)
            shouldPerformSegueWithIdentifier("EGDSegue", sender: self)
        }
    }
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var procedureName: UITextField!
    
    @IBOutlet weak var dateTextField: UITextField!
    
   
    @IBAction func textFieldEditing(sender: UITextField) {
        
        let datePickerView:UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.Date
        
        sender.inputView = datePickerView
        
        datePickerView.addTarget(self, action: #selector(ProcedureViewController.datePickerValueChanged), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func datePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        
        dateTextField.text = dateFormatter.stringFromDate(sender.date)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Procedure"
        nextButton.layer.cornerRadius = 5
        nextButton.layer.borderWidth = 1
        nextButton.layer.borderColor = UIColor(red: 0.0, green: 0.49, blue: 0.75, alpha: 1.0).CGColor
        procedureButton.layer.cornerRadius = 5
        procedureButton.layer.borderWidth = 1
        procedureButton.layer.borderColor = UIColor(red: 0.0, green: 0.49, blue: 0.75, alpha: 1.0).CGColor
        
        // Sets the placeholder text color to white.
        //procedureName.attributedPlaceholder = NSAttributedString(string: "Procedure", attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        //dateTextField.attributedPlaceholder = NSAttributedString(string: "Select Date", attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        

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
        //self.performSegueWithIdentifier("showView2", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showView2" {
            let destination = segue.destinationViewController as! ProcedurePopoverViewController
            let controller = destination.popoverPresentationController
            destination.passBackDelegate = self
            
            // Sets the coordinates of the popover arrow so that it points to the middle of the anchor view.
            segue.destinationViewController.popoverPresentationController?.sourceRect = CGRectMake(procedureButton.frame.size.width/2, procedureButton.frame.size.height, 0, 0)
            
            if  controller != nil {
                controller?.delegate = self
            }
        }
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "colonoscopySegue" || identifier == "EGDSegue" {
            if (plist != nil) {
                //let dict = plist!.getMutablePlistFile()!
                dict[procedureDateKey] = dateTextField.text!
                var errorMessage: String = ""
                do {
                    try dict[procedureKey] = chosenProcedure(procedureName)
                } catch dataReaderError.missingProcedure {
                    errorMessage = "Please select a procedure"
                } catch dataReaderError.notFromGivenList {
                    errorMessage = "Please make a selection from the given list"
                } catch {
                    errorMessage = "Something went wrong!"
                }
                
                if errorMessage != ""  {
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
                    
                }
                //4 Finally, print the values of the plist file. We’re grabbing a fresh copy of the plist file so you can see that the changes have been applied.
                
            }
            else {
                print("Unable to get Plist")
                return false
            }
            performSegueWithIdentifier(identifier, sender: sender)
        }
        
        return true
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    func sendString(myString: String) {
        procedureName.text = myString
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
