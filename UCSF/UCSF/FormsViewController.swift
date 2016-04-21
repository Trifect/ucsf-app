//
//  FormsViewController.swift
//  UCSF
//
//  Created by Kevin Nguyen on 4/19/16.
//  Copyright © 2016 Jimbus. All rights reserved.
//

import UIKit

class FormsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var noFormsLabel: UILabel!
    
    var forms : [String] = ["Form1", "Form2", "Form3", "Form4", "Form5", "Form6", "Form7", "Form8"] {
        didSet {
            if forms.count > 0 {
                tableView.hidden = false
                noFormsLabel.hidden = true
            } else {
                tableView.hidden = true
                noFormsLabel.hidden = false
            }
        }
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forms.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let form = self.tableView.dequeueReusableCellWithIdentifier("iPCell", forIndexPath: indexPath)
        form.textLabel?.text = forms[indexPath.row]
        return form
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if .Delete == editingStyle {
            let removedItem = forms.removeAtIndex(indexPath.row)
            let removedItemIndex = forms.indexOf(removedItem)
            if (removedItemIndex != nil) {
                forms.removeAtIndex(removedItemIndex!)
            }
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Right)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Forms"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
