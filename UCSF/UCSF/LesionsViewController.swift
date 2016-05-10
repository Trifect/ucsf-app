//
//  LesionsViewController.swift
//  UCSF
//
//  Created by Robert Posada on 4/20/16.
//  Copyright © 2016 Jimbus. All rights reserved.
//

import UIKit

class LesionsViewController: UIViewController {
    
    @IBOutlet weak var moreLesions: UISegmentedControl!
    
    @IBAction func nextButton(sender: AnyObject) {
        if(moreLesions.selectedSegmentIndex == 1){
            performSegueWithIdentifier("segue1", sender: self)
        }
        else {
            performSegueWithIdentifier("segue2", sender: self)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Lesions"
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
