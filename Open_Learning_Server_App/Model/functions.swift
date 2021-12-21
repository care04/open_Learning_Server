//
//  functions.swift
//  Open_Learning_Server_App
//
//  Created by Care Farrar on 12/21/21.
//

import Foundation
import UIKit
func hiddenEditButton(button: UIButton, course: updatedCourseModel) {
  let userName = UserDataSercice.instance.getUser().name
  if userName == "" || course.creator.name != userName {
    button.isEnabled = false
    button.isHidden = true
  }
}
