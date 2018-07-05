//
//  EventVolunteersTableViewController.swift
//  UBCSprouts
//
//  Created by Justin Zheng on 2018-05-02.
//  Copyright © 2018 Justin Zheng. All rights reserved.
//

import UIKit
import CoreData

class EventVolunteersTableViewController: UITableViewController {
    
    var eventData: EventMO!
    var eventVolunteers: [VolunteerMO]!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadVolunteers()
    }
    
    private func loadVolunteers() {
        if eventData == nil {
            fatalError("Well, I give up")
        } else {
            eventVolunteers = eventData.people?.allObjects as! [VolunteerMO]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func unwindToEventVolunteersList(sender: UIStoryboardSegue) {
        loadVolunteers()
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventData.people?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventVolunteersCell", for: indexPath) as UITableViewCell

        let volunteer = eventVolunteers[indexPath.row]
        
        cell.textLabel?.text = volunteer.first_name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            eventData.removeFromPeople(eventVolunteers[indexPath.row])
            loadVolunteers()
            tableView.reloadData()
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddVolunteer" {
            guard let destination = segue.destination as? EventAddVolunteersTableViewController else {
                fatalError("What am I even doing")
            }
            destination.eventData = eventData
        }
    }

}
