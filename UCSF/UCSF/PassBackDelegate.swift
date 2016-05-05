//
//  PassBackDelegate.swift
//  UCSF
//
//  Created by Kevin Nguyen on 5/3/16.
//  Copyright © 2016 Jimbus. All rights reserved.
//

import Foundation

// Delegate for passing back a chosen string from a popover
protocol PassBackDelegate {
    func sendString(myString:String)
}
