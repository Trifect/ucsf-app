//
//  POST.swift
//  UCSF
//
//  Created by Jisoo Kim on 4/6/16.
//  Copyright © 2016 Jimbus. All rights reserved.
//

import Foundation

func readPlist() -> NSDictionary {
    var plistdata: NSDictionary?
    if let path = NSBundle.mainBundle().pathForResource("data", ofType: "plist") {
        plistdata = NSDictionary(contentsOfFile: path)
    }
    return plistdata!
}

func emptyPOST() {
    
}

func savePOST() {
    //let data = readPlist()
}

func submitPOST() -> NSString { //incomplete!!!!!!
    let data = readPlist()
    
    var trainee: String = "", caseID: String = "", hospVal: Int = 0
    if (data.valueForKey("traineeName") != nil) {
        trainee = data.valueForKey("traineeName") as! String
    }
    
    if (data.valueForKey("caseID") != nil) {
        caseID = data.valueForKey("CaseID") as! String
    }
    
    if (data.valueForKey("hospital") != nil) {
        hospVal = data.valueForKey("hospital") as! Int
    }
    
    let objectJSON: Dictionary<String, NSObject> = [
                                                    "formID":[
                                                        "user": NSNull(),
                                                        "docID": NSNull()
                                                        ],
                                                    "properties":[
                                                        "submissionDate": NSNull(),
                                                        "completed": NSNull()
                                                        ],
                                                    "pID":[
                                                        "hosID":[
                                                            "Trainee": trainee,
                                                            "caseID": caseID,
                                                            "hospitalVal": hospVal
                                                            ],
                                                        "insID":[
                                                            NSNull()
                                                            ],
                                                        "procID":[
                                                            NSNull()
                                                            ],
                                                        "extID":[
                                                            NSNull()
                                                            ],
                                                        "findID":[
                                                            NSNull()
                                                            ]
                                                        ]
                                                    ]
    //["HospitalPage":["Trainee":trainee, "caseID":caseID, "hospitalVal": hospVal]] //this is very incomplete
    
    var submitJSON: NSString = ""
    if NSJSONSerialization.isValidJSONObject(objectJSON) {
        do {
            let jsonData = try NSJSONSerialization.dataWithJSONObject(objectJSON, options: .PrettyPrinted)
            submitJSON = NSString(data: jsonData, encoding: NSUTF8StringEncoding)!
        } catch {
            //some exception handling goes here
        }
    }
    return submitJSON
}


func regPOST(user: String, pw: String) -> NSString {
    return "" as NSString
}

func authPOST(user: String, pw: String) -> NSString{
    return "" as NSString
}