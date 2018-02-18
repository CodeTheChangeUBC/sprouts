//
//  PendingMealTableViewController.swift
//  UBCSprouts
//
//  Created by Justin Zheng on 2018-02-17.
//  Copyright © 2018 Justin Zheng. All rights reserved.
//

import UIKit

class PendingMealTableViewController: UITableViewController {

    private var pendingMeals = [PendingMeal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadPendingMeals()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func loadPendingMeals() {
        //TODO: Load actual pending meals
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pendingMeals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PendingMealTableViewCell", for: indexPath) as? PendingMealTableViewCell else {
            fatalError("Someone help me")
        }

        let pendingMeal = pendingMeals[indexPath.row]
        
        var state: String
        
        switch pendingMeal.state {
        case .needed: state = "Ordered"
        case .inProgress: state = "Cooking"
        case .done: state = "Ready"
        }
        
        cell.nameLabel.text = pendingMeal.meal.name
        cell.stateLabel.text = state

        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
 
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            pendingMeals.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pendingMeals[indexPath.row].nextState()
        self.tableView.reloadData()
    }
    
    @IBAction func addMeal(sender: UIStoryboardSegue) {
        if let source = sender.source as? MealTableViewController {
            let order = source.order
            
            for meal in order {
                let newIndexPath = IndexPath(row: pendingMeals.count, section: 0)
                pendingMeals.append(PendingMeal(meal))
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }
    
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
