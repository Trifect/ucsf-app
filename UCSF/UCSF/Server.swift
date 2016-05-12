//
//  ServerAPI.swift
//  UCSF
//
//  Created by Jisoo Kim on 4/6/16.
//  Copyright © 2016 Jimbus. All rights reserved.
//

import Foundation

let docID = ["00970379", "00611034", "00133759"]

func demoPartialForm() {
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
    
    var findingIDsDict = serverDict["findingIDs"] as! [String: [String]]
    var findingsNameDict = serverDict["findingNames"] as! [String: [String: Int]]
    var interventionsDict = serverDict["interventions"] as! [String: [String: Int]]
    var locationsDict = serverDict["locations"] as! [String: [String: Int]]
    var sizesDict = serverDict["sizes"] as! [String: [String: String]]
    
    var numOfFindingsDict = serverDict["findingsCounter"] as! [String: Int]
    
    traineeNamesDict[docID[0]] = "Jimbus"
    caseIDDict[docID[0]] = "00016016"
    hospitalDict[docID[0]] = 1
    instructorDict[docID[0]] = 3
    procDict[docID[0]] = 1
    dateDict[docID[0]] = "5/14/2016"
    extentDict[docID[0]] = 2
    insertTimeDict[docID[0]] = "37"
    withdrawlTimeDict[docID[0]] = "9"
    qualityDict[docID[0]] = 4
    flagDict[docID[0]] = true
    procNotesDict[docID[0]] = "This is a partially filled form for demosntration."
    
    completionDict[docID[0]] = false
    
    findingIDsDict[docID[0]] = ["1", "2"]
    findingsNameDict[docID[0]] = ["1":3, "2":5]
    interventionsDict[docID[0]] = ["1":1, "2":2]
    locationsDict[docID[0]] = ["1":4, "2":3]
    sizesDict[docID[0]] = ["1":"10", "2":"3"]
    
    numOfFindingsDict[docID[0]] = 2
    
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
    
    serverDict["findingIDs"] = findingIDsDict
    serverDict["findingNames"] = findingsNameDict
    serverDict["interventions"] = interventionsDict
    serverDict["locations"] = locationsDict
    serverDict["sizes"] = sizesDict
    
    serverDict["findingsCounter"] = numOfFindingsDict
}

func submitToServer(uniqID: String) { //interventions is wiping out dict data; fix asap!!!!!
    
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
    
    var findingIDsDict = serverDict["findingIDs"] as! [String: [String]]
    var findingsNameDict = serverDict["findingNames"] as! [String: [String: Int]]
    var interventionsDict = serverDict["interventions"] as! [String: [String: Int]]
    var locationsDict = serverDict["locations"] as! [String: [String: Int]]
    var sizesDict = serverDict["sizes"] as! [String: [String: String]]
    
    var numOfFindingsDict = serverDict["findingsCounter"] as! [String: Int]
    
    traineeNamesDict[uniqID] = dict.valueForKey("traineeName") as? String
    caseIDDict[uniqID] = dict.valueForKey("caseID") as? String
    hospitalDict[uniqID] = dict.valueForKey("hospital") as? Int
    instructorDict[uniqID] = dict.valueForKey("instructor") as? Int
    procDict[uniqID] = dict.valueForKey("procedure") as? Int
    dateDict[uniqID] = dict.valueForKey("procedureDate") as? String
    extentDict[uniqID] = dict.valueForKey("extentReached") as? Int
    insertTimeDict[uniqID] = dict.valueForKey("insertionTime") as? String
    withdrawlTimeDict[uniqID] = dict.valueForKey("withdrawlTime") as? String
    qualityDict[uniqID] = dict.valueForKey("prepQuality") as? Int
    flagDict[uniqID] = dict.valueForKey("flagCase") as? Bool
    procNotesDict[uniqID] = dict.valueForKey("procedureNotes") as? String
    
    completionDict[uniqID] = true
    
    var findingsIDArray: [String] = []
    var findingsNameArray: [String: Int] = [:]
    var interventionsArray: [String: Int] = [:]
    var locationsArray: [String: Int] = [:]
    var sizesArray: [String: String] = [:]
    
    let numberOfFindings: Int = dict["findings"]!.count
    print(numberOfFindings)
    for i in 0 ..< numberOfFindings {
        let findingIDKey = (dict.valueForKey("findings")![i].valueForKey("findingNumber") as? String)!
        //let findingIDKey = String(findingNumberInt)
        findingsIDArray.append(findingIDKey)
        //findingsNameArray.append((dict.valueForKey("findings")![i].valueForKey("finding") as? Int)!) //if submit is pressed without any findings, program crashes
        findingsNameArray[findingIDKey] = dict.valueForKey("findings")![i].valueForKey("finding") as? Int
        interventionsArray[findingIDKey] = dict.valueForKey("findings")![i].valueForKey("intervention") as? Int
        locationsArray[findingIDKey] = dict.valueForKey("findings")![i].valueForKey("location") as? Int
        sizesArray[findingIDKey] = dict.valueForKey("findings")![i].valueForKey("size") as? String
    } //change .valueforKey("finding") to .valueforkey("findingNumber")
    //create a new entry in server.plist that stores findingNumber as findingID:[docID:[findingNumber]]
    //change "findingNames" from "findingNames":[docID:[]] to "findingNames":[docID:[findingNumber:findingName]]
    
    findingIDsDict[uniqID] = findingsIDArray
    findingsNameDict[uniqID] = findingsNameArray
    interventionsDict[uniqID] = interventionsArray
    locationsDict[uniqID] = locationsArray
    sizesDict[uniqID] = sizesArray
    
    numOfFindingsDict[uniqID] = numberOfFindings
    
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
    
    serverDict["findingIDs"] = findingIDsDict
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
    
    let findingDict = serverDict["findingNames"]![uniqID] as! [String: Int]
    let interventionDict = serverDict["interventions"]![uniqID] as! [String: Int]
    let locationDict = serverDict["locations"]![uniqID] as! [String: Int]
    let sizeDict = serverDict["sizes"]![uniqID] as! [String: String]

    for i in 0 ..< counter {
        let findingKey = serverDict["findingIDs"]![uniqID]!![i] as! String
        
        let findingNameVal = findingDict[findingKey]
        let interventionVal = interventionDict[findingKey]
        let locationVal = locationDict[findingKey]
        let sizeVal = sizeDict[findingKey]
        if i == 0 {
            findingsArray[i] = ["finding":findingNameVal!,
                "intervention":interventionVal!,
                "location":locationVal!,
                "size":sizeVal!,
                "findingNumber":findingKey]
        }
        else {
            findingsArray.append(["finding":findingNameVal!,
                "intervention":interventionVal!,
                "location":locationVal!,
                "size":sizeVal!,
                "findingNumber":findingKey])
        }
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