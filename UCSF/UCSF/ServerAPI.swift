//
//  ServerAPI.swift
//  UCSF
//
//  Created by Jisoo Kim on 4/6/16.
//  Copyright © 2016 Jimbus. All rights reserved.
//

import Foundation


//mock up server
//send info to data.json

//create unit tests
//test json encoding with utf-8, utf-16, utf-32 and implement user handling for encoding other than those 3

class MockServer { //all the clientside vars should be optionals???
    /*
     QID1 - hosptial
     QID2 - trainer name
     QID3 - case ID
     QID6 - instructor
     QID28 - procedure
     QID75 - date
     QID11 - extent reached
     QID15 - insertion time
     QID14 - withdrawal time
     QID12 - quality
     QID47 - findings
     QID48 - size
     QID49 - location
     QID50 - intervention
     QID51 - more lesions question
     
     QID47 - QID67 (findings, size, location, intervention, more lesion?)
     QID41 - QID44 (findings, size, location, intervention after QID63 - QID67)
     
     QID27 - flag for follow up
     QID39 - procedure notes
     QID68 - rating
     QID71 - feedback
    */
    
    //clientside
    var users: [String] = []
    var userpw: [String: String] = [:] // users: pw
    
    //need to generate sessionIDs
    var docIDs: [String: [String]] = [:] //users: [docIDs]
    var caseIDs: [String: String] = [:] //docIDs: caseID
    var hospitals: [String: Int] = [:] //docIDs: Int -> hospitalList
    var procedures: [String: Int] = [:] //docIDs: Int -> link to procedureList
    var procedureDates: [String: String] = [:] //docIDs: dates
    
    //colonoscopy
    var extent: [String: Int] = [:] //keys docIDs -> link to extentList
    var insertTime: [String: String] = [:] //key docIDs
    var withdrawTime: [String: String] = [:] //key docIDs
    var quality: [String: Int] = [:] //keys docIDs -> link to qualityList
    var cspylocation: [String: Int] = [:] //key docIDs -> link to cspylocList
    
    //egd
    var egdlocation: [String: Int] = [:] //keys docIDs -> link to egdlocList
    
    var findings: [String: Int] = [:] //keys docIDs
    var size: [String: String] = [:] //keys docIDs
    var intervention: [String: Int] = [:] //docIDs: link to interventionList, will need to look for bool depending on app
    
    //???
    var transactionID: Int = 0
    //incomplete (last few more pages to include in server)
    
    //serverside - if not selected, set to 0 (our version of Null) and will be empty string or 0
    var hospitalList: [String] = [] //["", "SFGH", "Parnassus", "VA"]
    
    //change this var instructorList: [Dictionary], each instructor is now a dictionary
    //save all instructor under one large list of dictionaries
    //var instructorList: [Dictionary]
    var instructListSFGH: [String] = [] //["", "Cello","Day","Dai", "Maher", "Sewell","Somsouk","Tana"]
    var instructListParn: [String] = [] //["", "Dai","El-Nachef","Lee", "Mahadevan", "Ostroff","Singh","Terdiman","Velayos"]
    var instructListVA: [String] = []   //["", "Ghassemi","Monto","Ryan", "Rongey", "Shergill"]
    
    var procedureList: [String] = ["", "Colonoscopy", "EGD"]
    //colonoscopy
    var extentList: [String] = ["", "Rectum", "Sigmoid", "Descending", "Transverse", "Ascending", "Cecum",
                                "Terminal lleum"]
    var qualityList: [String] = ["", "Excellent--", "Very Good", "Good", "Poor", "Very Poor"]
    //egd
    
    var findingsList: [String] = ["", "Normal", "Polyp-sessile", "Polyp-predunculated", "Mass", "Ulcer", "Bleeding",
                                  "Varices", "Inflammaton"]
    var cspylocList: [String] = ["", "Rectum", "Sigmoid", "Descending", "Transverse", "Ascending", "Cecum",
                                 "Terminal lleum"]
    var egdlocList: [String] = ["", "Esophagus", "Stomach", "Duodenum"]
    var interventionList: [String] = ["", "Biopsy", "Snare cold", "Snare hot", "Injection submucosa", "Injection epi",
                                      "Injection sclero", "Banding", "Cautery bicap", "Cautery argon", "Clip",
                                      "Dilation", "pH-Bravo"]
    
    func setHospitals(hospitalList: [String]) {
        self.hospitalList = hospitalList
    }
    
    func setInstructors(sfList: [String], parnList: [String], vaList: [String]) {
        self.instructListSFGH = sfList
        self.instructListParn = parnList
        self.instructListVA = vaList
    }
    
    //communication functions
    func getPost(json: NSString) {
        //parse into users, userIDs and hospitals
    }
    
    func reply() { //have inputs be var names to retrieve those ie to get a reply for list of hospitals do func reply(var: hospitals) -> return hospitals
        //write and save to data.json
    }
}

//call server class reply function --> writes to data.json --> use responseAPI methods to get data --> enter into plist
//this occurs when clicking "in progress forms"

//use POST methods when user submits form then call server class getPost function to enter data into server