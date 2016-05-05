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

let docID = "000000001"

func submitToServer() {
    let data = readPlist()
    serverDict["completion"]?.addObject([docID: true] as NSMutableDictionary)
    serverDict["traineeNames"]?.addObject([docID:data.valueForKey("traineeName")!] as NSMutableDictionary)
    serverDict["caseIDs"]?.addObject([docID:data.valueForKey("caseID")!] as NSMutableDictionary)
    serverDict["hospitals"]?.addObject([docID:data.valueForKey("hospital")!] as NSMutableDictionary)
    serverDict["instructors"]?.addObject([docID:data.valueForKey("instructor")!] as NSMutableDictionary)
    serverDict["procedures"]?.addObject([docID:data.valueForKey("procedure")!] as NSMutableDictionary)
    serverDict["dates"]?.addObject([docID:data.valueForKey("procedureDate")!] as NSMutableDictionary)
    serverDict["extent"]?.addObject([docID:data.valueForKey("extentReached")!] as NSMutableDictionary)
    serverDict["insertTimes"]?.addObject([docID:data.valueForKey("insertionTime")!] as NSMutableDictionary)
    serverDict["withdrawTimes"]?.addObject([docID:data.valueForKey("withdrawlTime")!] as NSMutableDictionary)
    serverDict["quality"]?.addObject([docID:data.valueForKey("prepQuality")!] as NSMutableDictionary)
    
    /*
     serverDict["findingNames"]?.addObject([docID:data.valueForKey("findings")!.valueForKey("finding")!] as NSMutableDictionary)
     serverDict["sizes"]?.addObject([docID:data.valueForKey("findings")!.valueForKey("size")!] as NSMutableDictionary)
     serverDict["locations"]?.addObject([docID:data.valueForKey("findings")!.valueForKey("location")!] as NSMutableDictionary)
     serverDict["interventions"]?.addObject([docID:data.valueForKey("findings")!.valueForKey("intervention")!] as NSMutableDictionary)
     
     */ //finding stuff
}

class MockServer { //all the clientside vars should be optionals???
    
    //serverside - if not selected, set to 0 (our version of Null) and will be empty string or 0
    var hospitalList: [String] = ["SFGH", "Parnassus", "VA"]
    var instructList: [Dictionary<String, AnyObject>] = [[:]]
    var procedureList: [String] = ["", "Colonoscopy", "EGD"]
    var extentList: [String] = ["", "Rectum", "Sigmoid", "Descending", "Transverse", "Ascending", "Cecum", "Terminal lleum"]
    var qualityList: [String] = ["", "Excellent--", "Very Good", "Good", "Poor", "Very Poor"]
    var findingsList: [String] = ["", "Normal", "Polyp-sessile", "Polyp-predunculated", "Mass", "Ulcer", "Bleeding",
                                  "Varices", "Inflammaton"]
    var cspylocList: [String] = ["", "Rectum", "Sigmoid", "Descending", "Transverse", "Ascending", "Cecum",
                                 "Terminal lleum"]
    var egdlocList: [String] = ["", "Esophagus", "Stomach", "Duodenum"]
    var interventionList: [String] = ["", "Biopsy", "Snare cold", "Snare hot", "Injection submucosa", "Injection epi",
                                      "Injection sclero", "Banding", "Cautery bicap", "Cautery argon", "Clip",
                                      "Dilation", "pH-Bravo"]
    
    func setInstructors(SFGH: [String], Parn: [String], VA: [String]) {
        //
        var countSFGH = 1
        for instructors in SFGH {
            instructList.append(["Name": instructors, "Hospital": 1, "InstructVal": countSFGH])
            countSFGH += 1
        }
        
        var countParn = countSFGH //possibly just generalize count, but maybe I might use these for something
        for instructors in Parn {
            instructList.append(["Name": instructors, "Hospital": 2, "InstructVal": countParn])
            countParn += 1
        }
        
        var countVA = countParn
        for instructors in VA {
            instructList.append(["Name": instructors, "Hosptial": 3, "InstructVal": countVA])
            countVA += 1
        }
    }
    
    /*
    //communication functions
    func getPost(json: NSString) {
        //parse into users, userIDs and hospitals
    }
    
    func reply() { //have inputs be var names to retrieve those ie to get a reply for list of hospitals do func reply(var: hospitals) -> return hospitals
        //write and save to data.json
    }
    */
}

//call server class reply function --> writes to data.json --> use responseAPI methods to get data --> enter into plist
//this occurs when clicking "in progress forms"

//use POST methods when user submits form then call server class getPost function to enter data into server