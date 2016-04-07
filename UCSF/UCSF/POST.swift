//
//  POST.swift
//  UCSF
//
//  Created by Jisoo Kim on 4/6/16.
//  Copyright © 2016 Jimbus. All rights reserved.
//

import Foundation

//send post to serverapi.swift

//possibly create a function for reading from plist to have exception handling

func readPlist() -> NSDictionary {
    var plistdata: NSDictionary?
    if let path = NSBundle.mainBundle().pathForResource("data", ofType: "plist") {
        plistdata = NSDictionary(contentsOfFile: path)
    }
    return plistdata!
}

func selectHospital(hospital: String) -> Int { //have rob make hospital in plist [Int]
    var hospitalVal = 0
    let plistdata = readPlist()
    if let hospital = plistdata.valueForKey("hospital") as? String {
    
        if (hospital == "SFGH") {
            hospitalVal = 1
        }
        else if (hospital == "Parnassus") {
            hospitalVal = 2
        }
        else if (hospital == "VA") {
            hospitalVal = 3
        }
    }
    return hospitalVal
}

func makePOST() -> NSString {
    let plistdata = readPlist()
    var hospitalVal = 0
    if let hospital = plistdata.valueForKey("hospital") as? String {
        hospitalVal = selectHospital(hospital)
    }
    
    let trainee = plistdata.valueForKey("traineeName") as? String
    let caseID = plistdata.valueForKey("caseID") as? String
    
    let objectJSON: Dictionary<String, NSObject> = ["SM":NSNull(), "ED":NSNull(), "FormRuntime": NSNull(), "FormSessionID":"FS_10vEVOCdpkg6qJH", "Questions":["QID2":["Value":trainee!],"QID3":["Value":caseID!],"QID1":["Selected":hospitalVal]]]
    
    var readableJSONdata: NSString = ""
    if NSJSONSerialization.isValidJSONObject(objectJSON) {
        do {
            let jsonData = try NSJSONSerialization.dataWithJSONObject(objectJSON, options: .PrettyPrinted)
            readableJSONdata = NSString(data: jsonData, encoding: NSUTF8StringEncoding)!
            print(readableJSONdata)
        } catch {
            print("Error")
        }
    }
    return readableJSONdata
}