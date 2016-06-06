//
//  Configuration.swift
//  ContactsForce
//
//  Created by William Welbes on 6/6/16.
//  Copyright © 2016 Centare. All rights reserved.
//

import Foundation

public class Configuration {
    
    static let sharedInstance = Configuration()
    
    var salesforceConsumerKey:String = ""
    var salesforceRedirectUrl:String = ""
    
    //Private initializer to load config when accessed
    private init () {
        
        loadConfiguration()
    }
    
    private func loadConfiguration() {
        //Load the configuration from the config file
        if let plistPath = NSBundle.mainBundle().pathForResource("Configuration", ofType: "plist") {
            if let dict = NSDictionary(contentsOfFile: plistPath) {
                if let consumerKey = dict["SalesforceAPI"]?["ConsumerKey"] as? String {
                    salesforceConsumerKey = consumerKey
                }
                if let redirectUrl = dict["SalesforceAPI"]?["RedirectUrl"] as? String {
                    salesforceRedirectUrl = redirectUrl
                }
            }
        }
    }
}