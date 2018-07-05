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
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
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
    
    @IBAction func unwindToAddVolunteerView(sender: UIStoryboardSegue) {
        // Do nothing
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func timeSheet(_ sender: UIButton) {
        performSegue(withIdentifier: "shifts", sender: self)
    }
    
    @IBAction func addVolunteer(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: returnSegue, sender: sender)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        volunteerData.setValue(firstNameTextField.text, forKey: "first_name")
        volunteerData.setValue(lastNameTextField.text, forKey: "last_name")
        volunteerData.setValue(Int(ageTextField.text!), forKey: "age")
        volunteerData.setValue(emailTextField.text, forKey: "email")
        volunteerData.setValue(phoneNumberTextField.text, forKey: "phone_number")
        if let button = sender as? UIBarButtonItem, button === doneButton {
            if editingSelf {
                UserDefaults.standard.set(emailTextField.text, forKey: "email")
            }
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let managedContext = appDelegate.persistentContainer.viewContext
            do {
                try managedContext.save()
            } catch let error as NSError {
                fatalError("\(error), \(error.userInfo)")
            }
        } else if segue.identifier == "shifts" {
            let dest = segue.destination as! ShiftsTableViewController
            dest.volunteerData = volunteerData
        }
    }

}
