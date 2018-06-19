//
//  IngredientViewController.swift
//  UBCSprouts
//
//  Created by Nandini Bulusu on 2018-03-12.
//  Copyright © 2018 Justin Zheng. All rights reserved.
//

import UIKit
import os.log

class IngredientViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    //MARK: Properties
    @IBOutlet weak var ingredientNameTextField: UITextField!
    
    @IBOutlet weak var ingredientWeightTextField: UITextField!
    
    @IBOutlet weak var ingredientMaxTextField: UITextField!
    @IBOutlet weak var ingredientMinTextField: UITextField!
    
    @IBOutlet weak var ingredientTypePicker: UIPickerView!
    
    var ingredientTypeData: [String] = [String]()
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
   
    
    /*
     This value is either passed by `IngredientTableViewController` in `prepare(for:sender:)`
     or constructed as part of adding a new meal.
     */
    var ingredient: Ingredient?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect data:
        ingredientTypePicker.delegate = self
        ingredientTypePicker.dataSource = self
        
        //Inputing data into the Ingredient Type Picker
        ingredientTypeData = ["Dairy/Non-Dairy Product","Produce","Bread","Grains","Spices","Hot Drink","Packaged Drink","Packaged Food","Other"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Number of columns in the picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //Number of rows in the picker
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ingredientTypeData.count
    }
    //Returns ingredient type into the row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ingredientTypeData[row]
    }
    
    

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
    }
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
     }
    
    

}
