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

class MockServer { //how to structure this server???
    var users: [String] = []
    var userIDs: [String: String] = [:]
    var sessionIDs: [String: String] = [:]
    let hospitals = [1, 2, 3] //1 - SFGH, 2 - Parnassus, 3 - VA
    
    func getPost(json: NSString) {
        //parse into users, userIDs and hospitals
        let data = json.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        do {
            let data = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
            if let dictionary = data as? [String: AnyObject] {
                readJSONobject(dictionary)
            }
        } catch {
            print("error") //exception handling goes here, "error" for now; need sophisticated exception handling implementation
        }
    }
    
    func readJSONobject(object: [String: AnyObject]) { //break into smaller dictionaries
        guard let sessionID = object["FormSessionID"] as? String,
            let trainee = object["Questions"]!["QID2"]!!["Value"] as? String,
            let caseID = object["Questions"]!["QID3"]!!["Value"] as? String else { return }
        
        users.append(trainee)
        userIDs["\(trainee)"] = caseID
        sessionIDs["\(trainee)"] = sessionID
        //send these to plist
    }
    
    func reply() {
        //write and save to data.json
    }
}

//call server class reply function --> writes to data.json --> use responseAPI methods to get data --> enter into plist
//this occurs when clicking "in progress forms"

//use POST methods when user submits form then call server class getPost function to enter data into server