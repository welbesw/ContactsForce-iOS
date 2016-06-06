//
//  SalesforceContact.swift
//  ContactsForce
//
//  Created by William Welbes on 6/3/16.
//  Copyright © 2016 Centare. All rights reserved.
//

import Foundation

public class SalesforceContact {

    public var id: String?
    public var firstName: String?
    public var lastName: String?
    
    //Method to initialize with JSON dict returned by the  API
    public init(dictionary: [String : AnyObject]) {
        
        //Iterate over every item in the dictionary
        for(key, value) in dictionary {
            switch key.lowercaseString {
            case "id":
                self.id = value as? String
            case "firstname":
                self.firstName = value as? String
            case "lastname":
                self.lastName = value as? String
            default:
                //print("SalesforceContact field: \(key)")
                break
            }
        }
    }
}