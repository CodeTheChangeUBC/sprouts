//
//  SettingsViewController.swift
//  UBCSprouts
//
//  Created by Justin Zheng on 2018-02-17.
//  Copyright © 2018 Justin Zheng. All rights reserved.
//

import UIKit
import CoreData

class CheckInViewController: UIViewController {
    
    var user: PersonMO!
    var userShifts: [ShiftMO]!

    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var checkInButton: UIButton!
    
    @IBAction func viewInfo(_ sender: UIButton) {
        performSegue(withIdentifier: "info", sender: self)
    }
    
    @IBAction func checkInButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func logout(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "login")
        UserDefaults.standard.removeObject(forKey: "email")
        performSegue(withIdentifier: "logout", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let pred = NSPredicate(format: "email = %@", UserDefaults.standard.object(forKey: "email") as! CVarArg)
        guard let loginType = UserDefaults.standard.object(forKey: "login") as! String? else {
            fatalError("how is this error even possible")
        }
        var eventFetchRequest: NSFetchRequest<NSFetchRequestResult>
        if loginType == "admin" {
            eventFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Admin")
        } else if loginType == "member" {
            eventFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Volunteer")
        } else {
            fatalError("strings are confusing!")
        }
        eventFetchRequest.predicate = pred
        let listOfOneThing = try! managedContext.fetch(eventFetchRequest) as! [PersonMO]
        if listOfOneThing.count > 1 {
            fatalError("two users should not have the same email")
        } else if listOfOneThing.count == 0 {
            fatalError("email not valid")
        } else {
            user = listOfOneThing.first!
        }
        userShifts = user.shifts?.allObjects as! [ShiftMO]
        displayLabels()
    }
    
    private func displayLabels() {
        greetingLabel.text = "Hello, " + (user.first_name ?? "user")
        var currentShift: ShiftMO?
        for shift in userShifts {
            if !shift.completed {
                if currentShift != nil {
                    fatalError("user currently at two events, should not be possible")
                } else {
                    currentShift = shift
                }
            }
        }
        if currentShift == nil {
            statusLabel.text = "Status: off-duty"
            checkInButton.setTitle("Punch in", for: .normal)
        } else {
            statusLabel.text = "Status: currently attending " + (currentShift?.event?.name ?? "unnamed event")
            checkInButton.setTitle("Punch out", for: .normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "info" {
            guard let destination = segue.destination as? AddVolunteerViewController else {
                fatalError("This error does not have a number")
            }
            // Right now, the app only works for members. If used by an admin, this line will probably cause a crash
            destination.volunteerData = user as! VolunteerMO
            destination.returnSegue = "checkin"
        }
    }

}
