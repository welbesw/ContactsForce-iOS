//
//  SalesforceManager.swift
//  ContactsForce
//
//  Created by William Welbes on 6/6/16.
//  Copyright © 2016 Centare. All rights reserved.
//

import Foundation
import SalesforceSDKCore
import SalesforceRestAPI

public class SalesforceManager : NSObject, SFRestDelegate {
    
    //Define a shared instance for singleton
    static let sharedInstance = SalesforceManager()
    
    var consumerKey:String = ""
    var redirectUrl:String = ""
    
    private override init() {
        super.init()
        //Perform any setup - load the salesforce configuration
        
        SFLogger.setLogLevel(.Debug)
        
        consumerKey = Configuration.sharedInstance.salesforceConsumerKey
        redirectUrl = Configuration.sharedInstance.salesforceRedirectUrl
    }
    
    func setupSDKManager() {
        let salesforceSDKManager = SalesforceSDKManager.sharedManager()
        salesforceSDKManager.connectedAppId = self.consumerKey
        salesforceSDKManager.connectedAppCallbackUri = self.redirectUrl
        
        salesforceSDKManager.authScopes = ["web", "api"]
        
        //Post launch action handler
        salesforceSDKManager.postLaunchAction = { launchActionList in
            let launchActionString = SalesforceSDKManager.launchActionsStringRepresentation(launchActionList)
            print("postLaunchAction: \(launchActionString)")
        }
        
        //Launch error handler
        salesforceSDKManager.launchErrorAction = { error, launchActionList in
            //Log the error
            print("Error during launch of Salesforce SDK: \(error.localizedDescription)")
        }
        
        //Post logout action
        salesforceSDKManager.postLogoutAction = {
            print("SalesforceSDK log out.")
            
            //TODO: Reset app state
        }
    }
    
    func launch() {
        SalesforceSDKManager.sharedManager().launch()
    }
    
    func fetchContacts() {
        //TODO: Confirm that user is authenticated
        let request = SFRestAPI.sharedInstance().requestForQuery("SELECT Id, FirstName, LastName FROM Contact")
        
        SFRestAPI.sharedInstance().send(request, delegate: self)
    }
    
    //MARK: SFRestDelegate
    
    @objc public func request(request: SFRestRequest, didLoadResponse dataResponse: AnyObject) {
        //Request completed
        print("request:didLoadResponse")
    }
    
    @objc public func request(request: SFRestRequest, didFailLoadWithError error: NSError) {
        //There was an error in the request
        print("request:didFailLoadWithError: \(error.localizedDescription)")
    }
    
    @objc public func requestDidCancelLoad(request: SFRestRequest) {
        //Request was cancelled
        print("requestDidCancelLoad")
    }
    
    @objc public func requestDidTimeout(request: SFRestRequest) {
        //Request timed out
        print("requestDidTimeout")
    }
    
    
}
