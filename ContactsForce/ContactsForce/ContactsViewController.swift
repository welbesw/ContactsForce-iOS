//
//  ContactsViewController.swift
//  ContactsForce
//
//  Created by William Welbes on 6/6/16.
//  Copyright © 2016 Centare. All rights reserved.
//

import UIKit

class ContactsViewController: UITableViewController {

    private var contacts:[SalesforceContact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        SalesforceManager.sharedInstance.fetchContacts { (contacts, error) in
            dispatch_async(dispatch_get_main_queue(), { 
                if error == nil {
                    self.contacts = contacts
                    self.tableView.reloadData()
                } else {
                    let alertController = UIAlertController(title: "Error Loading Contacts", message: error!.localizedDescription, preferredStyle: .Alert)
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows
        return contacts.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("contactCell", forIndexPath: indexPath)

        // Configure the cell...
        
        let contact = contacts[indexPath.row]
        
        let firstName = contact.firstName != nil ? contact.firstName! : ""
        let lastName = contact.lastName != nil ? contact.lastName! : ""
        
        cell.textLabel?.text = "\(firstName) \(lastName)"

        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
