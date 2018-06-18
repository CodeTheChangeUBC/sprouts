//
//  SignInViewController.swift
//  UBCSprouts
//
//  Created by Justin Zheng on 2018-03-12.
//  Copyright © 2018 Justin Zheng. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var userField: UITextField!
    @IBOutlet weak var passField: UITextField!
    
    @IBAction func adminLogin(_ sender: UIButton) {
        tryLogIn(asAdmin: true)
    }
    
    @IBAction func memberLogin(_ sender: UIButton) {
        tryLogIn(asAdmin: false)
    }
    
    private func tryLogIn(asAdmin isAdmin: Bool) {
        if (checkInfo(withUsername: userField.text ?? "", withPassword: passField.text ?? "", asAdmin: isAdmin)) {
            if isAdmin {
                UserDefaults.standard.set("admin", forKey: "login")
            }
            else {
                UserDefaults.standard.set("member", forKey: "login")
            }
            performSegue(withIdentifier: "login", sender: self)
        } else {
            let alert = UIAlertController(title: "Error", message: "Login credentials invalid", preferredStyle: UIAlertControllerStyle.alert)
            let okButton = UIAlertAction(title: "dismiss", style: UIAlertActionStyle.default, handler: nil)
            alert.addAction(okButton)
            present(alert, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let status = UserDefaults.standard.object(forKey: "login")
        if (status != nil) {
            performSegue(withIdentifier: "login", sender: self)
        }
    }

    // TODO: implement properly
    // returns true if login info valid, false otherwise
    private func checkInfo(withUsername username: String, withPassword password: String, asAdmin isAdmin: Bool) -> Bool {
        return true
    }

}
