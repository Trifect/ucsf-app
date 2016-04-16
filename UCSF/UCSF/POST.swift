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

//depricated func
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

func regPOST() -> NSString { //user registration
    let filler: NSString = ""
    return filler
}

func authPOST() -> NSString { //login authentication
    let filler: NSString = ""
    return filler
}

func submitPOST() -> NSString { //during submission
    let plistdata = readPlist()
    var hospitalVal = 0
    if let hospital = plistdata.valueForKey("hospital") as? String {
        hospitalVal = selectHospital(hospital)
    }
    //need to completely redo this after plist is fully updated
    let trainee = plistdata.valueForKey("traineeName") as? String
    let caseID = plistdata.valueForKey("caseID") as? String
    
    let objectJSON: Dictionary<String, NSObject> = ["SM":NSNull(), "ED":NSNull(), "FormRuntime": NSNull(), "FormSessionID":"FS_10vEVOCdpkg6qJH", "Questions":["QID2":["Value":trainee!],"QID3":["Value":caseID!],"QID1":["Selected":hospitalVal]]]
    
    //testing purpose only, modify to save to clientData.json and send to ServerAPI.swift
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