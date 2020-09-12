//
//  TableViewCell.swift
//  CoreDataRelationships
//
//  Created by Gabriel Rosa on 9/11/20.
//  Copyright © 2020 Gabriel Rosa. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    public static let nibName = "TableViewCell"
    public static let identifier = "TableViewCellIdentifier"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setup(title: String, subtitle: String) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }        
}
