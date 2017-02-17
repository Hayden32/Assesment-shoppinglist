//
//  ShoppinglistTableViewCell.swift
//  AssesmentShoppinglist
//
//  Created by Hayden Hastings on 2/17/17.
//  Copyright © 2017 Hayden Hastings. All rights reserved.
//

import UIKit

class ShoppinglistTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var checkStarButton: UIButton!

    var delegate: ShoppinglistTableViewCellDelegate?
    
    var list: Shoppinglist? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let list = list else {
            titleLabel.text = ""; return }
        titleLabel.text = list.list
        
        // if else
        
        let image = list.inCart ? #imageLiteral(resourceName: "Full Star") : #imageLiteral(resourceName: "Empty Star")
        checkStarButton.setImage(image, for: .normal)
        }
    
    @IBAction func starButtonTapped(_ sender: Any) {
        delegate?.shoppinglistButtonTapped(sender: self)
    }
    
    }

protocol ShoppinglistTableViewCellDelegate {
    func shoppinglistButtonTapped(sender: ShoppinglistTableViewCell)
}


