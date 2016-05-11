//
//  InterventionViewController.swift
//  UCSF
//
//  Created by Robert Posada on 4/20/16.
//  Copyright © 2016 Jimbus. All rights reserved.
//

import UIKit

//need this because there are two different popovers on this page
protocol PassBackDelegate2 {
    func sendString2(myString:String)
}

class InterventionViewController: UIViewController,UIPopoverPresentationControllerDelegate,  PassBackDelegate, PassBackDelegate2 {
    
    @IBOutlet weak var locationButton: UIButton!
    
    @IBOutlet weak var locationName: UITextField!
    
    @IBOutlet weak var interventionName: UITextField!
    
    @IBOutlet weak var sizeTextField: UITextField!
    
    @IBOutlet weak var interventionButton: UIButton!
    
    @IBAction func popOver(sender: AnyObject) {
        self.performSegueWithIdentifier("showLocationView", sender: self)
    }
    
    
    @IBAction func popOver2(sender: AnyObject) {
        self.performSegueWithIdentifier("showInterventionSegue", sender: self)
    }
    
    var toPass:Int! = nil //this is the findings integer
    
    var findingDictionary: [String:AnyObject] = [:]
    
    var findingsArray: [[String:AnyObject]] = [[:]]
    
    @IBAction func nextButton(sender: AnyObject) {
        findingsArray = dict["findings"] as! Array<[String:AnyObject]>
        findingDictionary["finding"] = toPass
        findingDictionary["size"] = sizeTextField.text!
        findingDictionary["location"] = locationNames.indexOf(locationName.text!)!+1
        findingDictionary["intervention"] = interventionList.indexOf(interventionName.text!)!+1
        if (plist != nil) { //suggestion: create empty dictionary when do new finding first, kevin's idea to fix loop problem
            findingsArray.append(findingDictionary)
            dict[findingsKey] = findingsArray
            // dict[findingsKey]?.appendData(findingDictionary)
            do {
                try plist!.addValuesToPlistFile(dict)
            } catch {
                print(error)
            }
            
            print(plist!.getValuesInPlistFile())
            //print(dict)
        }
        else {
            print("Unable to get Plist")
        }
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
        
        if segue.identifier == "showInterventionSegue" {
            let destination = segue.destinationViewController as! InterventionPopoverViewController
            let controller = destination.popoverPresentationController
            destination.passBackDelegate = self
            
            segue.destinationViewController.popoverPresentationController?.sourceRect = CGRectMake(interventionButton.frame.size.width/2, 0, 0, 0)
            
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
        self.title = "Intervention"
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
    func sendString2(myString: String) {
        interventionName.text = myString
    }

}
