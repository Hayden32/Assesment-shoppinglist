//
//  ShoppinglistTableViewController.swift
//  AssesmentShoppinglist
//
//  Created by Hayden Hastings on 2/17/17.
//  Copyright © 2017 Hayden Hastings. All rights reserved.
//

import UIKit

class ShoppinglistTableViewController: UITableViewController, ShoppinglistTableViewCellDelegate {
    
    
    @IBAction func addButtonTapped(_ sender: Any) {
        
        
        let alertController = UIAlertController(title: "Shopping list", message: "Create a list of items you need", preferredStyle: .alert)
        
        var shoppinglistTextField: UITextField?
        
        alertController.addTextField { (textField) in
            shoppinglistTextField = textField
        }
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { (_) in
            guard let title = shoppinglistTextField?.text else { return }
            ShoppinglistController.shared.createShoppinglist(list: title)
            
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        alertController.addAction(submitAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "American Flag"), for: .defaultPrompt)
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ShoppinglistController.shared.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as? ShoppinglistTableViewCell else { return UITableViewCell() }
        
       let list = ShoppinglistController.shared.list[indexPath.row]
        cell.list = list
        cell.delegate = self
        
        
        return cell
    }
    
    func shoppinglistButtonTapped(sender: ShoppinglistTableViewCell) {
        guard let list = sender.list, let indexPath = tableView.indexPath(for: sender) else { return }
        ShoppinglistController.shared.update(list: list)
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let list = ShoppinglistController.shared.list[indexPath.row]
            ShoppinglistController.shared.delete(list: list)
            
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}


