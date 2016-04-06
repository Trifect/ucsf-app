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

    
    var instructorListSFGH = ["Cello","Day","Dai", "Maher", "Sewell","Somsouk","Tana"]
    var instructorListParnassus = ["Dai","El-Nachef","Lee", "Mahadevan", "Ostroff","Singh","Terdiman","Velayos"]
    var instructorListVA = ["Ghassemi","Monto","Ryan", "Rongey", "Shergill"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        return iCell
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
