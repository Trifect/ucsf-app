//
//  ServerAPI.swift
//  UCSF
//
//  Created by Jisoo Kim on 4/6/16.
//  Copyright © 2016 Jimbus. All rights reserved.
//

import Foundation

let docID = ["000000001", "000000002", "000000003", "000000004", "000000005"]

func submitToServer() { //interventions is wiping out dict data; fix asap!!!!!
    
    var traineeNamesDict = serverDict["traineeNames"] as! [String: String]
    var caseIDDict = serverDict["caseIDs"] as! [String: String]
    var hospitalDict = serverDict["hospitals"] as! [String: Int]
    var instructorDict = serverDict["instructors"] as! [String: Int]
    var procDict = serverDict["procedures"] as! [String: Int]
    var dateDict = serverDict["dates"] as! [String : String]
    var extentDict = serverDict["extent"] as! [String: Int]
    var insertTimeDict = serverDict["insertTimes"] as! [String: String]
    var withdrawlTimeDict = serverDict["withdrawTimes"] as! [String: String]
    var qualityDict = serverDict["quality"] as! [String: Int]
    var flagDict = serverDict["flags"] as! [String: Bool]
    var procNotesDict = serverDict["procNotes"] as! [String: String]
    
    var completionDict = serverDict["completion"] as! [String: Bool]
    
    traineeNamesDict[docID[0]] = dict.valueForKey("traineeName") as? String
    caseIDDict[docID[0]] = dict.valueForKey("caseID") as? String
    hospitalDict[docID[0]] = dict.valueForKey("hospital") as? Int
    instructorDict[docID[0]] = dict.valueForKey("instructor") as? Int
    procDict[docID[0]] = dict.valueForKey("procedure") as? Int
    dateDict[docID[0]] = dict.valueForKey("procedureDate") as? String
    extentDict[docID[0]] = dict.valueForKey("extentReached") as? Int
    insertTimeDict[docID[0]] = dict.valueForKey("insertionTime") as? String
    withdrawlTimeDict[docID[0]] = dict.valueForKey("withdrawlTime") as? String
    qualityDict[docID[0]] = dict.valueForKey("prepQuality") as? Int
    flagDict[docID[0]] = dict.valueForKey("flagCase") as? Bool
    procNotesDict[docID[0]] = dict.valueForKey("procedureNotes") as? String
    
    completionDict[docID[0]] = true
    
    var findingsNameDict = serverDict["findingNames"] as! [String: [Int]] //might have to make finding names as strings
    var interventionsDict = serverDict["interventions"] as! [String: [Int: Int]] //so that these are [String: [String: Int]]
    var locationsDict = serverDict["locations"] as! [String: [Int: Int]]
    var sizesDict = serverDict["sizes"] as! [String: [Int: String]]
    
    var numOfFindingsDict = serverDict["findingsCounter"] as! [String: Int]
    
    var findingsNameArray: [Int] = []
    var interventionsArray: [Int: Int] = [:]
    var locationsArray: [Int: Int] = [:]
    var sizesArray: [Int: String] = [:]
    
    let numberOfFindings: Int = dict["findings"]!.count
    for i in 0 ..< numberOfFindings {
        findingsNameArray.append((dict.valueForKey("findings")![i].valueForKey("finding") as? Int)!) //if submit is pressed without any findings, program crashes
        
        interventionsArray[(dict.valueForKey("findings")![i].valueForKey("finding") as? Int)!] = dict.valueForKey("findings")![i].valueForKey("intervention") as? Int
        locationsArray[(dict.valueForKey("findings")![i].valueForKey("finding") as? Int)!] = dict.valueForKey("findings")![i].valueForKey("location") as? Int
        sizesArray[(dict.valueForKey("findings")![i].valueForKey("finding") as? Int)!] = dict.valueForKey("findings")![i].valueForKey("size") as? String
    }
    
    findingsNameDict[docID[0]] = findingsNameArray
    interventionsDict[docID[0]] = interventionsArray
    locationsDict[docID[0]] = locationsArray
    sizesDict[docID[0]] = sizesArray
    
    numOfFindingsDict[docID[0]] = numberOfFindings
    
    serverDict["traineeNames"] = traineeNamesDict
    serverDict["caseIDs"] = caseIDDict
    serverDict["hospitals"] = hospitalDict
    serverDict["instructors"] = instructorDict
    serverDict["procedures"] = procDict
    serverDict["dates"] = dateDict
    serverDict["extent"] = extentDict
    serverDict["insertTimes"] = insertTimeDict
    serverDict["withdrawTimes"] = withdrawlTimeDict
    serverDict["quality"] = qualityDict
    serverDict["flags"] = flagDict
    serverDict["procNotes"] = procNotesDict
    serverDict["completion"] = completionDict
    
    serverDict["findingNames"] = findingsNameDict
    serverDict["interventions"] = interventionsDict
    serverDict["locations"] = locationsDict
    serverDict["sizes"] = sizesDict
    
    serverDict["findingsCounter"] = numOfFindingsDict
    
    print(serverDict)
}

func loadFromServer(uniqID: String) {
    
    dict[traineeNameKey] = serverDict["traineeNames"]![uniqID] as! String
    dict[caseIDKey] = serverDict["caseIDs"]![uniqID] as! String
    dict[hospitalKey] = serverDict["hospitals"]![uniqID] as! Int
    dict[instructorNameKey] = serverDict["instructors"]![uniqID] as! Int
    dict[procedureKey] = serverDict["procedures"]![uniqID] as! Int
    dict[procedureDateKey] = serverDict["dates"]![uniqID] as! String
    dict[extentReachedKey] = serverDict["extent"]![uniqID] as! Int
    dict[insertionTimeKey] = serverDict["insertTimes"]![uniqID] as! String
    dict[withdrawlTimeKey] = serverDict["withdrawTimes"]![uniqID] as! String
    dict[prepQualityKey] = serverDict["quality"]![uniqID] as! Int
    dict[procedureNotesKey] = serverDict["procNotes"]![uniqID] as! String
    dict[flagCaseKey] = serverDict["flags"]![uniqID] as! Bool
    
    let counter: Int = serverDict["findingsCounter"]![uniqID] as! Int
    var findingsArray: [[String:AnyObject]] = [[:]]
    
    let interventionDict = serverDict["interventions"]![uniqID] as! [Int:Int]
    let locationDict = serverDict["locations"]![uniqID] as! [Int:Int]
    let sizeDict = serverDict["sizes"]![uniqID] as! [Int:String]

    for i in 0 ..< counter {
        let findingKey = serverDict["findingNames"]![uniqID]!![i] as! Int
        let interventionVal = interventionDict[findingKey]
        let locationVal = locationDict[findingKey]
        let sizeVal = sizeDict[findingKey]
        findingsArray.append(["finding":findingKey,
                              "intervention":interventionVal!,
                              "location":locationVal!,
                              "size":sizeVal!])
    }
    dict[findingsKey] = findingsArray
}

class MockServer {
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