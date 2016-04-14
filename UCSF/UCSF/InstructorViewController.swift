//
//  InstructorViewController.swift
//  UCSF
//
//  Created by Robert Posada on 4/4/16.
//  Copyright © 2016 Jimbus. All rights reserved.
//

import UIKit

let instructorNameKey = "instructor"

var instructorListSFGH = ["Cello","Day","Dai", "Maher", "Sewell","Somsouk","Tana"]
var instructorListParnassus = ["Dai","El-Nachef","Lee", "Mahadevan", "Ostroff","Singh","Terdiman","Velayos"]
var instructorListVA = ["Ghassemi","Monto","Ryan", "Rongey", "Shergill"]
let allInstructors = instructorListSFGH + instructorListParnassus + instructorListVA


class InstructorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let myBlue: UIColor = UIColor.init(colorLiteralRed: 0, green: 0.486, blue: 0.745, alpha: 1.0)
    

    @IBOutlet weak var instructorTableView: UITableView!
    
    let instructorList = makeInstructorList(dict[hospitalKey] as! Int)
    
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
            return instructorList.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let iCell = self.instructorTableView.dequeueReusableCellWithIdentifier("iCell", forIndexPath: indexPath) as! instructorCell
        
        iCell.instructorName.text = instructorList[indexPath.row]
        let myBlue2: UIColor = UIColor.init(colorLiteralRed: 0.467, green: 0.686, blue: 0.847, alpha: 1.0)
        if (indexPath.row % 2 == 0) {
            iCell.backgroundColor = myBlue2
            
        }
        return iCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // this deals with saving into plist from selected cell
        let selectedRow = indexPath.row
        let instructorName = instructorList[selectedRow]
        if (plist != nil) {
            
            let dict = plist!.getMutablePlistFile()!
<<<<<<< HEAD
            
            dict[instructorNameKey] = allInstructors.indexOf(instructorName)!+1
=======
            dict[instructorNameKey] = allInstructors.indexOf(instructorName)
>>>>>>> d6d3e20e468dd90a18f38494090947a65a20d53f
            
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
<<<<<<< HEAD
=======
    
    
>>>>>>> d6d3e20e468dd90a18f38494090947a65a20d53f
}

func makeInstructorList(hospital: Int) -> [String] {
    switch hospital {
    case 1:
        return instructorListSFGH
    case 2:
        return instructorListParnassus
    case 3:
        return instructorListVA
    default:
        return []
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


