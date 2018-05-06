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

class PeopleTableViewController: UITableViewController, UISearchBarDelegate {
    
    let searchBar = UISearchBar()
    
    var tableData = [Volunteer]()
    var filtArray = [Volunteer]()
    var showResults = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSearchBar();
    }
    
    func loadVolunteers() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Blame the tutorial, not me!")
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let volunteerFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Volunteer")
        
        tableData = try! managedContext.fetch(volunteerFetchRequest) as! [Volunteer]
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
        
        filtArray = tableData.filter({(person: Volunteer) -> Bool in
            return person.name.lowercased().range(of: searchText.lowercased()) != nil
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
            cell.textLabel!.text = filtArray[indexPath.row].name
            return cell
        } else {
            cell.textLabel!.text = tableData[indexPath.row].name
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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
