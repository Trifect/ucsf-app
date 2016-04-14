//
//  ResponseAPI.swift
//  UCSF
//
//  Created by Jisoo Kim on 4/6/16.
//  Copyright © 2016 Jimbus. All rights reserved.
//

import Foundation

//get json object from serverapi.swift
//this will actually be pretty hard, this will be for old/in progress forms
let url = NSBundle.mainBundle().URLForResource("serverData", withExtension: "json")
let data = NSData(contentsOfURL: url!)

func response() {
    do {
        let object = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
        if let dictionary = object as? [String: AnyObject] {
            readJSONobject(dictionary)
        }
    } catch {
        print("error") //exception handling goes here, "error" for now; need sophisticated exception handling implementation
    }
}

//sample json reading
func readJSONobject(object: [String: AnyObject]) { //break into smaller dictionaries
    guard let sessionID = object["FormSessionID"] as? String,
        let trainee = object["Questions"]!["QID2"]!!["Value"] as? String,
        let caseID = object["Questions"]!["QID3"]!!["Value"] as? String else { return }
    
    print ("Form Session ID: \(sessionID)")
    print (trainee)
    print(caseID)
    //send these to plist
}