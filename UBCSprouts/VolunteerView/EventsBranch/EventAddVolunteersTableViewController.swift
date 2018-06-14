//
//  EventAddVolunteersTableViewController.swift
//  UBCSprouts
//
//  Created by Justin Zheng on 2018-05-02.
//  Copyright © 2018 Justin Zheng. All rights reserved.
//

import UIKit
import CoreData

class EventAddVolunteersTableViewController: UITableViewController {
    
    var eventData: EventMO!
    var volunteers: [VolunteerMO]!
    var makingNewEvent: Bool!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadVolunteers()
    }
    
    private func loadVolunteers() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Blame the tutorial, not me!")
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let volunteerFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Volunteer")
        
        volunteers = try! managedContext.fetch(volunteerFetchRequest) as! [VolunteerMO]
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return volunteers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventAddVolunteersCell", for: indexPath) as UITableViewCell
        
        let volunteer = volunteers[indexPath.row]
        
        cell.textLabel?.text = volunteer.first_name

        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Add" {
            let indexPath = tableView.indexPathForSelectedRow!
            let selectedVolunteer = volunteers[indexPath.row]
            if (eventData.people?.allObjects.contains(where: {($0 as! VolunteerMO) == selectedVolunteer}))! {
                let alert = UIAlertController(title: "Volunteer not added", message: "Volunteer is already signed up for this event!", preferredStyle: UIAlertControllerStyle.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                alert.addAction(okButton)
                present(alert, animated: true, completion: nil)
            } else {
                eventData.addToPeople(selectedVolunteer)
            }
        }
        
        guard let destination = segue.destination as? EventVolunteersTableViewController else {
            fatalError("What am I even doing")
        }
        destination.eventData = eventData
        destination.makingNewEvent = makingNewEvent
    }

}
