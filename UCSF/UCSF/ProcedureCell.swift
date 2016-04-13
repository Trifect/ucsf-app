//
//  ProcedureCell.swift
//  UCSF
//
//  Created by Robert Posada on 4/7/16.
//  Copyright © 2016 Jimbus. All rights reserved.
//

import UIKit

class ProcedureCell: UITableViewCell {
    
    
    @IBOutlet weak var procedureName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }

}
