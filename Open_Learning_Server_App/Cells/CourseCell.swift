//
//  CourseCell.swift
//  Open_Learning_Server_App
//
//  Created by Care Farrar on 9/1/21.
//

import UIKit

class CourseCell: UITableViewCell {
    
    //IBOutlets
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var shortDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fillCell(course: Course) {
        name.text = "Name: " + course.name
        price.text = "$" + String(course.price)
        shortDescription.text = "Description: " + course.shortDescription
    }

}
