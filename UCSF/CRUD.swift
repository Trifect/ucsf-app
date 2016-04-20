//
//  appAPI.swift
//  UCSF
//
//  Created by Jisoo Kim on 4/16/16.
//  Copyright © 2016 Jimbus. All rights reserved.
//

import Foundation

let filemanager = NSFileManager.defaultManager()

//grab temp directory path
let tempDir = NSTemporaryDirectory() as String

//set paths for all the .json files we need
let regJSON = tempDir.stringByAppendingString("reg.json") //json for registering
let authJSON = tempDir.stringByAppendingString("auth.json") //json for logging in
let submitJSON = tempDir.stringByAppendingString("submit.json") //json for submitting fully completed form
let saveJSON = tempDir.stringByAppendingString("save.json") //json for saving partial completion
let emptyJSON = tempDir.stringByAppendingString("empty.json") //json to request for specific things form server

func initCRUD() {
    
    if filemanager.fileExistsAtPath(regJSON) {
        return
    } else {
        filemanager.createFileAtPath(regJSON, contents: nil, attributes: nil)
    }
    
    if filemanager.fileExistsAtPath(authJSON) {
        return
    } else {
        filemanager.createFileAtPath(authJSON, contents: nil, attributes: nil)
    }
    
    if filemanager.fileExistsAtPath(submitJSON) {
        return
    } else {
        filemanager.createFileAtPath(submitJSON, contents: nil, attributes: nil)
    }
    
    if filemanager.fileExistsAtPath(saveJSON) {
        return
    } else {
        filemanager.createFileAtPath(saveJSON, contents: nil, attributes: nil)
    }
    
    if filemanager.fileExistsAtPath(emptyJSON) {
        return
    } else {
        filemanager.createFileAtPath(emptyJSON, contents: nil, attributes: nil)
    }
}

func writeCRUD(data: NSString, dest: String) {
    let newData = data as String
    
    do {
        try newData.writeToFile(dest, atomically: true, encoding: NSUTF8StringEncoding)
    } catch {
        print("failed to write") //implement actual fail to write func
    }
}

func readCRUD(dest: String) {
    
}

//use this to check for and create files