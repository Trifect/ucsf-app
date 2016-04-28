//
//  Plist.swift
//  UCSF
//
//  Created by Robert Posada on 4/4/16.
//  Copyright © 2016 Jimbus. All rights reserved.
//

// The file in the Xcode project is not changed. This is correct and this is the way it should be. We do not change the plist file in Xcode, instead we make a copy of it to the DocumentsDirectory on the user’s device (your computer when run on the simulator) and we change that one. When you will try to get the new value it will be fetched from the “copied” plist.

import Foundation

struct Plist {
    // 1 Create a PlistError enum to hold our error. We use this later when we are trying to save data.
    enum PlistError: ErrorType {
        case FileNotWritten
        case FileDoesNotExist
    }
    // 2 The 'name' property is going to hold the name of our plist file. We will set this in our initializer.
    let name:String
    // 3 The sourcePath is a computed property.  The initial location of the plist file is somewhere in your bundle. The NSBundle.mainBundle().pathForResorce( ofType:) will return the path of the plsit. sourcePath is optional and will return .None if no path is found.
    var sourcePath:String? {
        guard let path = NSBundle.mainBundle().pathForResource(name, ofType: "plist") else {return .None}
        return path
    }
    // 4 The destPath is like the sourPath property. We need to get the Documents directory for the application and we can use the provided method to retrieve this. Next we cast our directory as NSString and use the stringByAppendingPathComponent to add the file name.
    var destPath: String? {
        guard sourcePath != .None else {return .None}
        let dir = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
        return (dir as NSString).stringByAppendingPathComponent("\(name).plist")
    }
    // CREATE INITIALIZER
    init?(name:String) {
        //1 We set our name property.
        self.name = name
        //2 We’re going to do some work in the file system so we need the default instance of the NSFileManager.

        let fileManager = NSFileManager.defaultManager()
        //3 Here are some checks before we do anything. I expect all of these to pass every time, but just in case they will return nil if they don’t validate.
        guard let source = sourcePath else { return nil }
        guard let destination = destPath else { return nil }
        guard fileManager.fileExistsAtPath(source) else { return nil }
        //4 VERY IMPORTANT!!! Upon initialization we will copy the plist from the main bundle to the Documents directory, but we only want to do this once. We have to check if the file is already in the documents directory to prevent overwriting it.
        if !fileManager.fileExistsAtPath(destination) {
            //5 Copy the file. The copyItemAtPath( toPath:) method throws so we have to wrap it in a do-try-catch.
            do {
                try fileManager.copyItemAtPath(source, toPath: destination)
            } catch let error as NSError {
                print("Unable to copy file. ERROR: \(error.localizedDescription)")
                return nil
            }
        }
    }
    //METHODS: 
    //1 The method is getValueInPlistFile and it returns an optional NSDictionary.  If you notice when you set up your plist it is arranged in a key-value manner. It is essentially a NSDictionary, so that’s what we will return.  If for some reason we can’t cast our file as a NSDictionary, we will return .None
    func getValuesInPlistFile() -> NSDictionary? {
        let fileManager = NSFileManager.defaultManager()
        if fileManager.fileExistsAtPath(destPath!) {
            guard let dict = NSDictionary(contentsOfFile: destPath!) else {return .None}
            return dict
        }
        else {
            return .None
        }
    }
    //2 The next method is getMutablePlistFile and returns an optional NSMutableDictionary.  NSDictionary is an immutable object. This is fine if you don’t want to modify the values. However, if you want to make and save changes, you’ll need to get a NSMutableDictionary.  The rest of the method is the same.
    func getMutablePlistFile() -> NSMutableDictionary? {
        let fileManager = NSFileManager.defaultManager()
        if fileManager.fileExistsAtPath(destPath!) {
            guard let dict = NSMutableDictionary(contentsOfFile: destPath!) else {return .None}
            return dict
        }
        else {
            return .None
        }
    }
    //3 The final method is addValuesToPlistFile. This method takes a NSDictionary as a parameter and it will throw an error if unsuccessful. Again we need the NSFileManager and will check to ensure the file exists before we do anything. It should, but if it doesn’t we’ll throw our custom error. If it does, well write the NSDictionary to file to disk. When we get the values we aren’t actually interacting with the file, we’re copying the contents into our NSDictionary.  It is because of this that we have to write our NSDictionary to file.  This will overwrite the current file with the new values. If it is unsuccessful, we will throw our custom error.
    func addValuesToPlistFile(dictionary: NSDictionary) throws {
        let fileManager = NSFileManager.defaultManager()
        if fileManager.fileExistsAtPath(destPath!) {
            if !dictionary.writeToFile(destPath!, atomically: false) {
                print("File not written succesfully")
                throw PlistError.FileNotWritten
            }
        }
        else {
            throw PlistError.FileDoesNotExist
        }
    }
    
}

