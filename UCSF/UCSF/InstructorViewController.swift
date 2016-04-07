//
//  InstructorViewController.swift
//  UCSF
//
//  Created by Robert Posada on 4/4/16.
//  Copyright © 2016 Jimbus. All rights reserved.
//

import UIKit

let instructorNameKey = "instructorName"

class InstructorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let myBlue: UIColor = UIColor.init(colorLiteralRed: 0, green: 0.486, blue: 0.745, alpha: 1.0)
    

    @IBOutlet weak var instructorTableView: UITableView!
    
    var instructorListSFGH = ["Cello","Day","Dai", "Maher", "Sewell","Somsouk","Tana"]
    var instructorListParnassus = ["Dai","El-Nachef","Lee", "Mahadevan", "Ostroff","Singh","Terdiman","Velayos"]
    var instructorListVA = ["Ghassemi","Monto","Ryan", "Rongey", "Shergill"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = myBlue
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int {
            return instructorListSFGH.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let iCell = self.instructorTableView.dequeueReusableCellWithIdentifier("iCell", forIndexPath: indexPath) as! instructorCell
        
        iCell.instructorName.text = instructorListSFGH[indexPath.row]
        let myBlue2: UIColor = UIColor.init(colorLiteralRed: 0.467, green: 0.686, blue: 0.847, alpha: 1.0)
        if (indexPath.row % 2 == 0) {
            iCell.backgroundColor = myBlue2
            
        }
    
        return iCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // this deals with saving into plist from selected cell
        let selectedRow = indexPath.row
        let instructorName = instructorListSFGH[selectedRow]
        if (plist != nil) {
            
            let dict = plist!.getMutablePlistFile()!
            dict[instructorNameKey] = instructorName
            
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
