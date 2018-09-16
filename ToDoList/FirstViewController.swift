//
//  FirstViewController.swift
//  ToDoList
//
//  Created by Mohamed Salah Zidane on 7/3/18.
//  Copyright © 2018 Mohamed Salah Zidane. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet var table: UITableView!
    
    var items = [String]()
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return items.count
    }
    
    
 
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        let itemObject = UserDefaults.standard.object(forKey: "items")
        if let item = itemObject as? [String] {
            items = item
        }
        table.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            items.remove(at: indexPath.row)
            table.reloadData()
            UserDefaults.standard.set(items, forKey: "items")
        }
    }
/*
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == UITableViewCellEditingStyle.Delete {
     numbers.removeAtIndex(indexPath.row)
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
     }
     }
 */
}

