//
//  AddVolunteerViewController.swift
//  UBCSprouts
//
//  Created by SauravSaha on 3/26/18.
//  Copyright © 2018 Justin Zheng. All rights reserved.
//

import UIKit
import CoreData

class AddVolunteerViewController: UIViewController, UINavigationBarDelegate{

    //MARK: Properties
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var addVolunteerNavigationBar: UINavigationBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addVolunteerNavigationBar.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addVolunteer(_ sender: UIBarButtonItem) {
        print("beginning save")
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Blame the tutorial, not me!")
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let volunteerEntity = NSEntityDescription.entity(forEntityName: "Volunteer", in: managedContext)!
        
        let newVolunteer = NSManagedObject(entity: volunteerEntity, insertInto: managedContext)
        
        newVolunteer.setValue(firstNameTextField.text, forKey: "first_name")
        newVolunteer.setValue(lastNameTextField.text, forKey: "last_name")
        newVolunteer.setValue(Int(ageTextField.text!), forKey: "age")
        newVolunteer.setValue(emailTextField.text, forKey: "email")
        newVolunteer.setValue(phoneNumberTextField.text, forKey: "phone_number")
        newVolunteer.setValue("Vancouver", forKey: "campus")
        newVolunteer.setValue(Date(), forKey: "dateJoined")
        newVolunteer.setValue(0, forKey: "totalHoursWorked")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            fatalError("AAAAA \(error), \(error.userInfo)")
        }
        
        let volunteerFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Volunteer")
        
        let tableData = try! managedContext.fetch(volunteerFetchRequest) as! [VolunteerMO]
        
        print(tableData.count)
        
        performSegue(withIdentifier: "save", sender: sender)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
