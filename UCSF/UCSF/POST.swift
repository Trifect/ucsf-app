//
//  POST.swift
//  UCSF
//
//  Created by Jisoo Kim on 4/6/16.
//  Copyright © 2016 Jimbus. All rights reserved.
//

import Foundation

//send post to serverapi.swift

func makePOST() -> NSString {
    let objectJSON: Dictionary<String, NSObject> = ["SM":NSNull(), "ED":NSNull(), "FormRuntime": NSNull(), "FormSessionID":"FS_10vEVOCdpkg6qJH", "Questions":["QID2":["Value":"Tester"],"QID3":["Value":"9999"],"QID1":["Selected":"2"]]]
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