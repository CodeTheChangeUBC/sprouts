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
    var returnSegue: String!
    var editingSelf: Bool! // if true, get new access token after modifying info

    //MARK: Properties
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if volunteerData == nil {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let managedContext = appDelegate.persistentContainer.viewContext
            let eventEntity = NSEntityDescription.entity(forEntityName: "Volunteer", in: managedContext)!
            volunteerData = NSManagedObject(entity: eventEntity, insertInto: managedContext) as! VolunteerMO
            addingNewVolunteer = true
            editingSelf = false
        } else {
            firstNameTextField.text = volunteerData.first_name
            lastNameTextField.text = volunteerData.last_name
            ageTextField.text = String(volunteerData.age)
            emailTextField.text = volunteerData.email
            phoneNumberTextField.text = volunteerData.phone_number
            addingNewVolunteer = false
            editingSelf = (UserDefaults.standard.object(forKey: "email") as! String) == volunteerData.email
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        managedContext.rollback()
        performSegue(withIdentifier: returnSegue, sender: self)
    }
    
    @IBAction func timeSheet(_ sender: UIButton) {
        volunteerData.setValue(firstNameTextField.text, forKey: "first_name")
        volunteerData.setValue(lastNameTextField.text, forKey: "last_name")
        volunteerData.setValue(Int(ageTextField.text!), forKey: "age")
        volunteerData.setValue(emailTextField.text, forKey: "email")
        volunteerData.setValue(phoneNumberTextField.text, forKey: "phone_number")
        
        performSegue(withIdentifier: "shifts", sender: self)
    }
    
    @IBAction func addVolunteer(_ sender: UIBarButtonItem) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Blame the tutorial, not me!")
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        volunteerData.setValue(firstNameTextField.text, forKey: "first_name")
        volunteerData.setValue(lastNameTextField.text, forKey: "last_name")
        volunteerData.setValue(Int(ageTextField.text!), forKey: "age")
        volunteerData.setValue(emailTextField.text, forKey: "email")
        volunteerData.setValue(phoneNumberTextField.text, forKey: "phone_number")
        
        if editingSelf {
            UserDefaults.standard.set(emailTextField.text, forKey: "email")
        }
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            fatalError("\(error), \(error.userInfo)")
        }
        
        performSegue(withIdentifier: returnSegue, sender: sender)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "shifts" {
            let dest = segue.destination as! ShiftsTableViewController
            dest.volunteerData = volunteerData
            dest.addingNewVolunteer = addingNewVolunteer
            dest.returnSegue = returnSegue
            dest.editingSelf = editingSelf
        }
    }

}
