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
    
    override func viewDidLoad() {
        let localserver = MockServer()
        print("Server initialized")
        localserver.setHospitals(["", "SFGH", "Parnassus", "VA"])
        
        let instructListSFGH: [String] = ["Cello","Day","Dai", "Maher", "Sewell","Somsouk","Tana"]
        let instructListParn: [String] = ["Dai","El-Nachef","Lee", "Mahadevan", "Ostroff","Singh","Terdiman","Velayos"]
        let instructListVA: [String] = ["Ghassemi","Monto","Ryan", "Rongey", "Shergill"]
        
        localserver.setInstructors(instructListSFGH, Parn: instructListParn, VA: instructListVA)
        
        
        super.viewDidLoad()

        username.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        password.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        loginButton.layer.cornerRadius = 5
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.whiteColor().CGColor
        
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

}
