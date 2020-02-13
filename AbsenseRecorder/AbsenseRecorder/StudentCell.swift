//
//  StudentCell.swift
//  AbsenseRecorder
//
//  Created by Karlson, Richard (JMOB) on 08/02/2020.
//  Copyright © 2020 Karlson, Richard (JMOB). All rights reserved.
//

import UIKit

class StudentCell: UITableViewCell {


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.accessoryType = selected ? .none : .checkmark
        
    }

}
