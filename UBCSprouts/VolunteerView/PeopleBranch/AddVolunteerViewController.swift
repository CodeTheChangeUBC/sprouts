//
//  AddVolunteerViewController.swift
//  UBCSprouts
//
//  Created by SauravSaha on 3/26/18.
//  Copyright © 2018 Justin Zheng. All rights reserved.
//

import UIKit
import CoreData

class AddVolunteerViewController: UIViewController {
    
    var volunteerData: VolunteerMO!
    var addingNewVolunteer: Bool!

    //MARK: Properties
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if volunteerData == nil {
            addingNewVolunteer = true
        } else {
            addingNewVolunteer = false
            firstNameTextField.text = volunteerData.first_name
            lastNameTextField.text = volunteerData.last_name
            ageTextField.text = String(volunteerData.age)
            emailTextField.text = volunteerData.email
            phoneNumberTextField.text = volunteerData.phone_number
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addVolunteer(_ sender: UIBarButtonItem) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Blame the tutorial, not me!")
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let volunteerEntity = NSEntityDescription.entity(forEntityName: "Volunteer", in: managedContext)!
        
        if addingNewVolunteer {
            let newVolunteer = NSManagedObject(entity: volunteerEntity, insertInto: managedContext)
            newVolunteer.setValue(firstNameTextField.text, forKey: "first_name")
            newVolunteer.setValue(lastNameTextField.text, forKey: "last_name")
            newVolunteer.setValue(Int(ageTextField.text!), forKey: "age")
            newVolunteer.setValue(emailTextField.text, forKey: "email")
            newVolunteer.setValue(phoneNumberTextField.text, forKey: "phone_number")
            newVolunteer.setValue("Vancouver", forKey: "campus")
            newVolunteer.setValue(Date(), forKey: "dateJoined")
        } else {
            volunteerData.setValue(firstNameTextField.text, forKey: "first_name")
            volunteerData.setValue(lastNameTextField.text, forKey: "last_name")
            volunteerData.setValue(Int(ageTextField.text!), forKey: "age")
            volunteerData.setValue(emailTextField.text, forKey: "email")
            volunteerData.setValue(phoneNumberTextField.text, forKey: "phone_number")
        }
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            fatalError("\(error), \(error.userInfo)")
        }
        
        performSegue(withIdentifier: "save", sender: sender)
    }
}
