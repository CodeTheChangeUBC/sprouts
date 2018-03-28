//
//  EventDetailsViewController.swift
//  UBCSprouts
//
//  Created by Justin Zheng on 2018-03-26.
//  Copyright © 2018 Justin Zheng. All rights reserved.
//

import UIKit

class EventDetailsViewController: UIViewController {
    
    var event: Event!
    var makingNewEvent: Bool!

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if event == nil {
            event = Event(called: "", atLocation: "", describedAs: "", withID: getNextEventId())
            makingNewEvent = true
        } else {
            nameField.text = event.name
            locationField.text = event.location
            descriptionField.text = event.description
            makingNewEvent = false
        }
    }
    
    // replace with backend call later
    private func getNextEventId() -> Int {
        return 3
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //replace with backend call later
    @IBAction func saveEvent(_ sender: Any) {
        if makingNewEvent {
            // store new event in db
        } else {
            // update db
        }
        performSegue(withIdentifier: "Save", sender: sender)
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
