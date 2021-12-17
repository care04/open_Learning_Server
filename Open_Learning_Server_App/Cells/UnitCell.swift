//
//  LessonCell.swift
//  Open_Learning_Server_App
//
//  Created by Care Farrar on 9/1/21.
//

import UIKit

class UnitCell: UITableViewCell {

    //MARK: IBOutlets
    @IBOutlet weak var unitName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func fillUnitCell(unit: Unit) {
            unitName.text = "Name: " +  unit.name
        }
    }

