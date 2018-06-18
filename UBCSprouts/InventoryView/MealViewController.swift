//
//  MealViewController.swift
//  UBCSprouts
//
//  Created by Nandini Bulusu on 2018-03-27.
//  Copyright © 2018 Justin Zheng. All rights reserved.
//

import UIKit

class MealViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var mealNameTextField: UITextField!
    @IBOutlet weak var addingredientButton: UIButton!
    @IBOutlet weak var ingredientList: UITableView!
    

    @IBAction func addIngredient(_ sender: Any) {
        performSegue(withIdentifier: "addingredient", sender: self)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
    

    
    

}
