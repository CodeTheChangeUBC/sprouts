//
//  PeopleTableViewController.swift
//  UBCSprouts
//
//  Created by SauravSaha on 3/22/18.
//  Copyright © 2018 Justin Zheng. All rights reserved.
//

import UIKit
import Foundation
import CoreData

var tableData = ["Bill", "Harry", "Jack"]
var emailData = ["123@abc.com", "456@abc.com", "789@abc.com"]
var campusData = ["Vancouver", "Okanagan", "Vancouver"]
var phoneData = ["123", "456", "789"]
var ageData = ["22", "18", "16"]

var myIndex = 0

class PeopleTableViewController: UITableViewController, UISearchBarDelegate {
    
    let searchBar = UISearchBar()
    
    
    var tableData = [VolunteerMO]()
    var filtArray = [VolunteerMO]()
    var showResults = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSearchBar();
        loadVolunteers()
    }
    
    private func loadVolunteers() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Blame the tutorial, not me!")
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let volunteerFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Volunteer")
        
        tableData = try! managedContext.fetch(volunteerFetchRequest) as! [VolunteerMO]
    }
    
    func createSearchBar() {
        
        searchBar.showsCancelButton = false
        searchBar.delegate = self
        searchBar.placeholder = "volunteer search"
        
        self.navigationItem.titleView = searchBar
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filtArray = tableData.filter({(person: VolunteerMO) -> Bool in
            return person.first_name?.lowercased().range(of: searchText.lowercased()) != nil
        })
        
        if (searchText != "") {
            showResults = true
            self.tableView.reloadData()
        } else {
            showResults = false
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (showResults) {
            return filtArray.count
        } else {
            return tableData.count }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
        
        if(showResults) {
            cell.textLabel!.text = filtArray[indexPath.row].first_name
            return cell
        } else {
            cell.textLabel!.text = tableData[indexPath.row].first_name
            return cell
        }
        
    }
    
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchBar.endEditing(true)
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        showResults = true
        searchBar.endEditing(true)
        self.tableView.reloadData()
    }

    // Saurav was trying to do something with this but it isn't ready yet
    //override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    //{
    //    myIndex = indexPath.row
    //    performSegue(withIdentifier: "volunteerDetailSegue", sender: self)
    //}
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                fatalError("Blame the tutorial, not me!")
            }
            let managedContext = appDelegate.persistentContainer.viewContext
            
            managedContext.delete(tableData[indexPath.row])
            
            do {
                try managedContext.save()
            } catch let error as NSError {
                fatalError("AAAAA \(error), \(error.userInfo)")
            }
            
            loadVolunteers()
            tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "edit" {
            guard let selectedCell = sender as? UITableViewCell else {
                fatalError("Honestly there's no chance this error should happen")
            }
            guard let destination = segue.destination as? AddVolunteerViewController else {
                fatalError("There's a small chance this error could happen")
            }
            guard let indexPath = tableView.indexPath(for: selectedCell) else {
                fatalError("I would not be surprised if this error happened")
            }
            let selectedVolunteerMO = tableData[indexPath.row]
            destination.volunteerData = selectedVolunteerMO
            destination.returnSegue = "people"
        }
    }

}
