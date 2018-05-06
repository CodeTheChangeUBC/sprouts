//
//  EventsTableViewController.swift
//  UBCSprouts
//
//  Created by Justin Zheng on 2018-03-22.
//  Copyright © 2018 Justin Zheng. All rights reserved.
//

import UIKit

class EventsTableViewController: UITableViewController {
    
    var events = [Event]()

    override func viewDidLoad() {
        super.viewDidLoad()

        loadSampleEvents()
    }
    
    private func loadSampleEvents() {
        events.append(Event(called: "Test Event 1", atLocation: "DMP 201", describedAs: "An example event", withID: 000001))
        let v1 = Volunteer(withName: "Alice", withID: 11111, havingWorkedThisTerm: 10.5, havingWorkedInTotal: 10.5)
        let v2 = Volunteer(withName: "Bob", withID: 22222, havingWorkedThisTerm: 11, havingWorkedInTotal: 15)
        var testVolunteersList = [Volunteer]()
        testVolunteersList.append(v1)
        testVolunteersList.append(v2)
        events.append(Event(called: "Test Event 2", atLocation: "New restaurant", describedAs: "This one has volunteers", withID: 000002, withVolunteers: testVolunteersList))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EventsTableViewCell", for: indexPath) as? EventsTableViewCell else {
            fatalError("I give up")
        }

        let event = events[indexPath.row]
        
        cell.nameLabel.text = event.name
        cell.locationLabel.text = event.location
        cell.descriptionLabel.text = event.description

        return cell
    }
 

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
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

    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Edit" {
            guard let selectedCell = sender as? EventsTableViewCell else {
                fatalError("selectedCell failed")
            }
            guard let destination = segue.destination as? EventDetailsViewController else {
                fatalError("segue.destination failed")
            }
            guard let indexPath = tableView.indexPath(for: selectedCell) else {
                fatalError("selectedEvent not in table")
            }
            let selectedEvent = events[indexPath.row]
            destination.event = selectedEvent
        }
    }

}
