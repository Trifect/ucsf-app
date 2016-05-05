//
//  Global.swift
//  UCSF
//
//  Created by Robert Posada on 5/4/16.
//  Copyright © 2016 Jimbus. All rights reserved.
//

import Foundation

let instructListSFGH: [String] = ["Cello","Day","Dai", "Maher", "Sewell","Somsouk","Tana"]
let instructListParn: [String] = ["Dai","El-Nachef","Lee", "Mahadevan", "Ostroff","Singh","Terdiman","Velayos"]
let instructListVA: [String] = ["Ghassemi","Monto","Ryan", "Rongey", "Shergill"]

let traineeNameKey = "traineeName"
let caseIDKey = "caseID"
let hospitalKey = "hospital"
let procedureKey = "procedure"
let procedureDateKey = "procedureDate"
let extentReachedKey = "extentReached"
let insertionTimeKey = "insertionTime"
let withdrawlTimeKey = "withdrawlTime"
let prepQualityKey = "prepQuality"

let plist = Plist(name: "data")
let dict = plist!.getMutablePlistFile()!

let serverData = Plist(name: "Server")
let serverDict = serverData!.getMutablePlistFile()!