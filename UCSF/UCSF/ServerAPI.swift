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

class MockServer {
    var users: [String: String] = [:]
    var userIDs: [String: String] = [:]
    let hospitals = [1, 2, 3] //1 - SFGH, 2 - Parnassus, 3 - VA
    
    func getPost(json: NSString) {
        //parse into users, userIDs and hospitals
    }
    func reply() {
        //write and save to data.json
    }
}