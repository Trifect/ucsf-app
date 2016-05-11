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

//-----------------------------------
let instructorNameKey = "instructor"

var instructorListSFGH = ["Cello","Day","Dai", "Maher", "Sewell","Somsouk","Tana"]
var instructorListParnassus = ["Dai","El-Nachef","Lee", "Mahadevan", "Ostroff","Singh","Terdiman","Velayos"]
var instructorListVA = ["Ghassemi","Monto","Ryan", "Rongey", "Shergill"]
let allInstructors = instructorListSFGH + instructorListParnassus + instructorListVA
//-----------------------------------
var interventionList = ["Biopsy","Snare Cold", "Snare Hot", "Injection Submucosa", "Injection Epi", "Injection Sclero", "Banding", "Cautery Bicap", "Cautery Argon", "Clip", "Dilation", "pH-Bravo"]

let traineeNameKey = "traineeName"
let caseIDKey = "caseID"
let hospitalKey = "hospital"
let procedureKey = "procedure"
let procedureDateKey = "procedureDate"
let extentReachedKey = "extentReached"
let insertionTimeKey = "insertionTime"
let withdrawlTimeKey = "withdrawlTime"
let prepQualityKey = "prepQuality"
let procedureNotesKey = "procedureNotes"
let flagCaseKey = "flagCase"
let findingsKey = "findings"

let plist = Plist(name: "data")
let dict = plist!.getMutablePlistFile()!

func newDataPlist() {
    //wipe plist every time new form
    dict[findingsKey] = [] //check this later, delete old findings
    dict[traineeNameKey] = ""
    dict[caseIDKey] = ""
    dict[hospitalKey] = 0
    dict[instructorNameKey] = 0 //change to instructorKey later
    dict[procedureKey] = 0
    dict[procedureDateKey] = ""
    dict[extentReachedKey] = 0
    dict[insertionTimeKey] = ""
    dict[withdrawlTimeKey] = ""
    dict[prepQualityKey] = 0
    dict[procedureNotesKey] = ""
    dict[flagCaseKey] = false
}

let serverData = Plist(name: "Server")
let serverDict = serverData!.getMutablePlistFile()!