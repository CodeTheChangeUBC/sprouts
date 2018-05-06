//
//  EventVolunteersTableViewController.swift
//  UBCSprouts
//
//  Created by Justin Zheng on 2018-05-02.
//  Copyright © 2018 Justin Zheng. All rights reserved.
//

import UIKit

class EventVolunteersTableViewController: UITableViewController, VolunteerDelegate {
    
    var event: Event!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func checkout(atIndex index: Int) {
        event.volunteers[index].endRecord()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return event.volunteers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EventVolunteersCell", for: indexPath) as? EventsVolunteersTableViewCell else {
            fatalError("AAAAAAAA")
        }

        let volunteer = event.volunteers[indexPath.row]
        
        cell.nameLabel.text = volunteer.name
        cell.delegate = self
        cell.index = indexPath.row

        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
 
    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
