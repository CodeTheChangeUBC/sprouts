//
//  EventAddVolunteersTableViewController.swift
//  UBCSprouts
//
//  Created by Justin Zheng on 2018-05-02.
//  Copyright © 2018 Justin Zheng. All rights reserved.
//

import UIKit

class EventAddVolunteersTableViewController: UITableViewController {
    
    var event: Event!
    var volunteers: [Volunteer]!

    override func viewDidLoad() {
        super.viewDidLoad()
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EventsAddVolunteerCell", for: indexPath) as? EventsAddVolunteerTableViewCell else {
            fatalError("Note: replace this with some arbitrary error number to look more legit")
        }

        let volunteer = volunteers[indexPath.row]
        
        cell.nameLabel.text = volunteer.name

        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
