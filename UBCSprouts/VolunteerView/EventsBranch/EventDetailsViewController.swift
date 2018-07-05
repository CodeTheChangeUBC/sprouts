//
//  EventDetailsViewController.swift
//  UBCSprouts
//
//  Created by Justin Zheng on 2018-03-26.
//  Copyright © 2018 Justin Zheng. All rights reserved.
//

import UIKit
import CoreData

class EventDetailsViewController: UIViewController {
    
    var eventData: EventMO!
    var makingNewEvent: Bool!

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var editButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if eventData == nil {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let managedContext = appDelegate.persistentContainer.viewContext
            let eventEntity = NSEntityDescription.entity(forEntityName: "Event", in: managedContext)!
            eventData = NSManagedObject(entity: eventEntity, insertInto: managedContext) as! EventMO
            makingNewEvent = true
        } else {
            nameField.text = eventData.name
            locationField.text = eventData.location
            descriptionField.text = eventData.event_description
            makingNewEvent = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToEventDetails(sender: UIStoryboardSegue) {
        // How do you write "do nothing" in swift?
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        if let button = sender as? UIBarButtonItem, button === backButton {
            managedContext.rollback()
        } else {
            eventData.setValue(nameField.text, forKey: "name")
            eventData.setValue(locationField.text, forKey: "location")
            eventData.setValue(descriptionField.text, forKey: "event_description")
            if let button = sender as? UIButton, button === editButton {
                guard let destination = segue.destination as? EventVolunteersTableViewController else {
                    fatalError("What am I even doing")
                }
                destination.eventData = eventData
            } else {
                do {
                    try managedContext.save()
                } catch let error as NSError {
                    fatalError("\(error), \(error.userInfo)")
                }
            }
        }
    }
}
