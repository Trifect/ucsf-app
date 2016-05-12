//
//  FlagCaseViewController.swift
//  UCSF
//
//  Created by Robert Posada on 4/16/16.
//  Copyright © 2016 Jimbus. All rights reserved.
//

import UIKit

class FlagCaseViewController: UIViewController {
    
    
    @IBOutlet weak var procedureNotes: UITextView!
    
    @IBOutlet weak var flagCase: UISegmentedControl!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func nextButton(sender: AnyObject) {
        if (plist != nil) {
            //let dict = plist!.getMutablePlistFile()!
            if flagCase.selectedSegmentIndex == 1 {
                dict[flagCaseKey] = true
            }
            else {
                dict[flagCaseKey] = false
            }
            dict[procedureNotesKey] = procedureNotes.text
            do {
                try plist!.addValuesToPlistFile(dict)
            } catch {
                print(error)
            }
            print(plist!.getValuesInPlistFile())
        }
        else {
            print("Unable to get Plist")
        }
        
        submitToServer()
        newDataPlist()
//        loadFromServer(docID[0])
//        print(dict)
        self.performSegueWithIdentifier("unWindToHome", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Flag Case"
        procedureNotes.layer.cornerRadius = 5
        procedureNotes.layer.borderColor = UIColor.grayColor().CGColor
        procedureNotes.layer.borderWidth = 1
        
        nextButton.layer.cornerRadius = 5
        nextButton.layer.borderWidth = 1
        nextButton.layer.borderColor = UIColor(red: 0.0, green: 0.49, blue: 0.75, alpha: 1.0).CGColor
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
