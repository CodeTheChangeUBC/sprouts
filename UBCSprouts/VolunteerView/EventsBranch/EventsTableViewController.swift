//
//  EventsTableViewController.swift
//  UBCSprouts
//
//  Created by Justin Zheng on 2018-03-22.
//  Copyright © 2018 Justin Zheng. All rights reserved.
//

import UIKit
import CoreData

class EventsTableViewController: UITableViewController {
    
    var tableData = [EventMO]()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadEvents()
    }
    
    private func loadEvents() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let eventFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Event")
        tableData = try! managedContext.fetch(eventFetchRequest) as! [EventMO]
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
        return tableData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EventsTableViewCell", for: indexPath) as? EventsTableViewCell else {
            fatalError("I give up")
        }

        let event = tableData[indexPath.row]
        
        cell.nameLabel.text = event.name
        cell.locationLabel.text = event.location
        cell.descriptionLabel.text = event.event_description

        return cell
    }
 

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                fatalError("Blame the tutorial, not me!")
            }
            let managedContext = appDelegate.persistentContainer.viewContext
            
            managedContext.delete(tableData[indexPath.row])
            
            do {
                try managedContext.save()
            } catch let error as NSError {
                fatalError("AAAAA \(error), \(error.userInfo)")
            }
            
            loadEvents()
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
            let selectedEvent = tableData[indexPath.row]
            destination.eventData = selectedEvent
        }
    }

}
