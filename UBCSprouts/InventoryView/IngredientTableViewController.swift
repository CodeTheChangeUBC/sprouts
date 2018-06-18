//
//  IngredientTableViewController.swift
//  UBCSprouts
//
//  Created by Justin Zheng on 2018-02-17.
//  Copyright © 2018 Justin Zheng. All rights reserved.
//

import UIKit
import os.log

class IngredientTableViewController: UITableViewController, ReplenishDelegate {
    
    func replenish(forIndex index: Int) {
        records[index].ingredient.amount = records[index].maxAmount
        tableView.reloadData()
    }
    
    private var records = [IngredientStock]()
    var pickedIngredient: IngredientStock?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadIngredients()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // TODO: load actual ingredients
    private func loadIngredients() {
        records.append(IngredientStock(withName: "Potatoes", forAmount: 5.0, forMaxAmount: 10.0, inUnits: "kg"))
        records.append(IngredientStock(withName: "Ketchup", forAmount: 5.0, forMaxAmount: 5.0, inUnits: "oz"))
        records.append(IngredientStock(withName: "Guacamole", forAmount: 0.0, forMaxAmount: 1.0, inUnits: "oz"))
    }
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func replenish(_ sender: UIBarButtonItem) {
        for i in records.indices {
            records[i].ingredient.amount = records[i].maxAmount
        }
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientTableViewCell", for: indexPath) as? IngredientTableViewCell else {
            fatalError("Something went wrong and I don't know how to fix it")
        }
        
        let record = records[indexPath.row]
        
        cell.nameLabel.text = record.ingredient.name
        cell.quantityLabel.text = record.getQuantityAsString()
        cell.setIndex(as: indexPath.row)
        cell.delegate = self
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
    

}
