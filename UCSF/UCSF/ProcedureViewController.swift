//
//  ProcedureViewController.swift
//  UCSF
//
//  Created by Robert Posada on 4/7/16.
//  Copyright © 2016 Jimbus. All rights reserved.
//

import UIKit

let procedureKey = "procedure"
let procedureDateKey = "procedureDate"

class ProcedureViewController: UIViewController, UIPopoverPresentationControllerDelegate, PassBackDelegate {
    
    @IBOutlet weak var procedureButton: UIButton!

    @IBAction func nextButton(sender: AnyObject) {
        
        if (plist != nil) {
            let dict = plist!.getMutablePlistFile()!
            dict[procedureDateKey] = dateTextField.text!
            if  procedureNames.indexOf(procedureName.text!) != nil {
                dict[procedureKey] = procedureNames.indexOf(procedureName.text!)!+1
            } else {
                dict[procedureKey] = 0
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
        nextButton.layer.borderColor = UIColor.whiteColor().CGColor
        procedureButton.layer.cornerRadius = 5
        procedureButton.layer.borderWidth = 1
        procedureButton.layer.borderColor = UIColor.whiteColor().CGColor
        
        // Sets the placeholder text color to white.
        procedureName.attributedPlaceholder = NSAttributedString(string: "Procedure", attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        dateTextField.attributedPlaceholder = NSAttributedString(string: "Select Date", attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func popOver(sender: AnyObject) {
        self.performSegueWithIdentifier("showView2", sender: self)
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
