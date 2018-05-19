//
//  MealViewController.swift
//  UBCSprouts
//
//  Created by Nandini Bulusu on 2018-03-27.
//  Copyright © 2018 Justin Zheng. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: Properties
    @IBOutlet weak var mealNameTextField: UITextField!
    @IBOutlet weak var addingredientButton: UIButton!
    @IBOutlet weak var ingredientList: UITableView!
    
    let cellReuseIdentifier = "IngredientTableViewCell"
    private var records = [IngredientStock] ()
    private var ingredients = [Ingredient] ()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ingredientList.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        ingredientList.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt  indexPath: IndexPath) -> UITableViewCell {
        guard let cell =
            tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? IngredientTableViewCell else {
                fatalError("Something's wrong")
        }
    
        return cell
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {


    }
    @IBAction func selectedIngredient(unwindSegue: UIStoryboardSegue) {
        let IngredientTableViewController = unwindSegue.source as! IngredientTableViewController
        
        if let selectedIngredient = IngredientTableViewController.pickedIngredient {
            let newIndexPath = IndexPath(row: records.count, section: 0)
            records.append(selectedIngredient)
            ingredientList.insertRows(at: [newIndexPath], with: .automatic)
        }
        
    }
    @IBAction func addNewIngredient(_ sender: Any) {
        self.performSegue(withIdentifier: "addingredient", sender: self)
    }
    
    
    

}
