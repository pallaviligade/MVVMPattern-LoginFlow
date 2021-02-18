//
//  EmployeeTableViewCell.swift
//  LoginValidationMVVM
//
//  Created by Pallavi on 14/02/21.
//  Copyright © 2021 Pallavi. All rights reserved.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {
    @IBOutlet weak var employeeName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
