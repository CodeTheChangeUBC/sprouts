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
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MealTableViewCell", for: indexPath) as? MealTableViewCell else {
            fatalError("Something went wrong and I don't know how to fix it")
        }
        
        let meal = meals[indexPath.row]
        
        cell.nameLabel.text = meal.name
        cell.priceLabel.text = meal.getPriceAsString()
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        for i in 0..<meals.count {
            guard let currentCell = tableView.visibleCells[i] as? MealTableViewCell else {
                fatalError("Someone used the wrong type of cell")
            }
            for _ in 0..<currentCell.getQuantity() {
                order.append(meals[i])
            }
        }
    }
}
