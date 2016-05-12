//
//  LoginViewController.swift
//  UCSF
//
//  Created by Kevin Nguyen on 4/14/16.
//  Copyright © 2016 Jimbus. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var errorMessageField: UITextView!
    
    func inputedUserInfo(username: UITextField, password: UITextField) throws {
        if username.text! == "" {
            throw dataReaderError.missingUsername
        }
        if password.text! == "" {
            throw dataReaderError.missingPassword
        }
    }
    
    
    override func viewDidLoad() {
    //SERVER --------------------------------------------------------------------------------------------------------||
    //---------------------------------------------------------------------------------------------------------------||
        let localserver = MockServer()
        print("Server initialized")
        
        localserver.setInstructors(instructListSFGH, Parn: instructListParn, VA: instructListVA)
    //SERVER END ----------------------------------------------------------------------------------------------------||
        
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

        //username.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        //password.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        loginButton.layer.cornerRadius = 5
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.whiteColor().CGColor
        
        // Do any additional setup after loading the view.
        
        newDataPlist()
    }

    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        
        if identifier == "login" {
            var errorMessage: String = ""
            do {
                try inputedUserInfo(username,password: password)
            } catch dataReaderError.missingUsername {
                errorMessage = "Please enter your username"
            } catch dataReaderError.missingPassword {
                errorMessage = "Please enter your password"
            } catch {
                errorMessage = "Login failed"
            }
            if errorMessage != "" {
                errorMessageField.text = errorMessage
                errorMessageField.textAlignment = NSTextAlignment.Center
                errorMessageField.textColor = UIColor.orangeColor()
                errorMessageField.hidden = false
                return false
            }
        }
        return true
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
