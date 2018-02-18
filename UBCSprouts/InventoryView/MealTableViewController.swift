//
//  MealTableViewController.swift
//  UBCSprouts
//
//  Created by Justin Zheng on 2018-02-17.
//  Copyright © 2018 Justin Zheng. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
    
    private var meals = [Meal]()
    
    // used for passing to pending meals
    var order = [Meal]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.allowsMultipleSelection = true
        
        loadMeals()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //TODO: load actual meals
    private func loadMeals() {
        meals.append(Meal(withName: "French fries", atPrice: 499, withIngredients: [Ingredient(withName: "Potatoes", forAmount: 0.5, inUnits: "kg"), Ingredient(withName: "Ketchup", forAmount: 1, inUnits: "oz")]))
        meals.append(Meal(withName: "French fries with guac", atPrice: 499, withIngredients: [Ingredient(withName: "Potatoes", forAmount: 0.5, inUnits: "kg"), Ingredient(withName: "Guacamole", forAmount: 1, inUnits: "oz")]))
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MealTableViewCell", for: indexPath) as? MealTableViewCell else {
            fatalError("Something went wrong and I don't know how to fix it")
        }
        
        let meal = meals[indexPath.row]
        
        cell.nameLabel.text = meal.name
        cell.priceLabel.text = meal.getPriceAsString()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false // TODO: implement making a meal
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO: the task of handling ingredient depletion is left to the backend
        order.append(meals[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        order.remove(at: indexPath.row)
    }

}
