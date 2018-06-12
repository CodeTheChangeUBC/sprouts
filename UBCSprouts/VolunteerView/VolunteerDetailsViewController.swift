//
//  VolunteerDetailsViewController.swift
//  UBCSprouts
//
//  Created by SauravSaha on 6/12/18.
//  Copyright © 2018 Justin Zheng. All rights reserved.
//

import UIKit

class VolunteerDetailsViewController: UIViewController {

    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstNameLabel.text = "First Name: " + tableData[myIndex]
        ageLabel.text = "Age: " + ageData[myIndex]
        emailLabel.text = "Email: " + emailData[myIndex]
        phoneNumberLabel.text = "Phone Number: " + phoneData[myIndex]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
