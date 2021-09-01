//
//  LessonCell.swift
//  Open_Learning_Server_App
//
//  Created by Care Farrar on 9/1/21.
//

import UIKit

class LessonCell: UITableViewCell {

    //MARK: IBOutlets
    @IBOutlet weak var lessonName: UILabel!
    @IBOutlet weak var lessonDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func fillLessonCell(lesson: Lesson) {
            lessonName.text = "Name: " +  lesson.name
            lessonDescription.text = "Description: " + lesson.description
        }
    }

