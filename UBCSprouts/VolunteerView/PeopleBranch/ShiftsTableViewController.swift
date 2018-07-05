//
//  ShiftsTableViewController.swift
//  UBCSprouts
//
//  Created by Justin Zheng on 2018-06-21.
//  Copyright © 2018 Justin Zheng. All rights reserved.
//

import UIKit
import CoreData

class ShiftsTableViewController: UITableViewController {
    
    var volunteerData: VolunteerMO!
    var tableData: [ShiftMO]!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableData = volunteerData.shifts?.allObjects as! [ShiftMO]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tableData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShiftsTableViewCell", for: indexPath) as? ShiftsTableViewCell else {
            fatalError("I'm basically copy-pasting from the EventsTableViewController code here")
        }
        
        let shift = tableData[indexPath.row]

        cell.nameLabel.text = (shift.event?.name ?? "Unnamed event")
        
        let cal = Calendar.current
        
        if let endDate = shift.end {
            let startHour = String(cal.component(.hour, from: shift.start!))
            let startMinute = String(cal.component(.minute, from: shift.start!))
            let endHour = String(cal.component(.hour, from: endDate))
            let endMinute = String(cal.component(.minute, from: endDate))
            
            let times = startHour + ":" + startMinute + "-" + endHour + ":" + endMinute
            
            cell.timeLabel.text = times
            
            let duration = DateInterval(start: shift.start!, end: shift.end!).duration
            
            // Rounds hours to two decimal places
            let totalHours = String(Double(round(100 * duration / 3600) / 100))
            
            cell.hoursLabel.text = totalHours + " hours"
        } else {
            cell.timeLabel.text = "In progress"
            
            let duration = DateInterval(start: shift.start!, end: Date()).duration
            let totalHours = String(Double(round(100 * duration / 3600) / 100))
            cell.hoursLabel.text = totalHours + " hours so far"
        }

        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let managedContext = appDelegate.persistentContainer.viewContext
            managedContext.delete(tableData[indexPath.row])
            tableData.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
}
