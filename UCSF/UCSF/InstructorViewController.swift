//
//  InstructorViewController.swift
//  UCSF
//
//  Created by Robert Posada on 4/4/16.
//  Copyright © 2016 Jimbus. All rights reserved.
//

import UIKit

class InstructorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var instructorTableView: UITableView!
    
    let instructorList = makeInstructorList(dict[hospitalKey] as! Int)
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Instructor"
        tableView.backgroundColor = UIColor.init(white: 0.95, alpha: 1.0)//UIColor.init(colorLiteralRed: 242, green: 242, blue: 242, alpha: 1.0)

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
        //let myGray: UIColor = UIColor.init(colorLiteralRed: 242, green: 242, blue: 242, alpha: 1.0)
        //if (indexPath.row % 2 == 0) {
        //iCell.backgroundColor = myGray
            
        //}
        return iCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // this deals with saving into plist from selected cell
        let selectedRow = indexPath.row
        let instructorName = instructorList[selectedRow]
        if (plist != nil) {
            
            let dict = plist!.getMutablePlistFile()!
            
            dict[instructorNameKey] = allInstructors.indexOf(instructorName)!+1

            
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


