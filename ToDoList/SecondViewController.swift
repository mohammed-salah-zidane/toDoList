//
//  SecondViewController.swift
//  ToDoList
//
//  Created by Mohamed Salah Zidane on 7/3/18.
//  Copyright © 2018 Mohamed Salah Zidane. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITextFieldDelegate {

    var items = [String]()
    @IBOutlet weak var addTextField: UITextField!
    
    
    @IBAction func addBtn(_ sender: Any) {
    
       let itemObject = UserDefaults.standard.object(forKey: "items")
        if let item = itemObject as? [String] {
            items = item
            items.append(addTextField.text!)
        }else{
            items = [addTextField.text!]
        }
        UserDefaults.standard.set(items, forKey: "items")
        addTextField.text = ""
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
    }
}

