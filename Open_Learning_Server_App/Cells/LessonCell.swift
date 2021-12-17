//
//  LessonCell.swift
//  Open_Learning_Server_App
//
//  Created by Care Farrar on 12/17/21.
//

import UIKit

class LessonCell: UITableViewCell {
  
  //MARK: IBOUTLETS
  @IBOutlet weak var lessonName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

  func fillLessonCell(lesson: Lesson) {
    lessonName.text = lesson.name
  }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
