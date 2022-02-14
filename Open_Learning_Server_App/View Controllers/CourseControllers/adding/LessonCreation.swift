//
//  LessonCreation.swift
//  Open_Learning_Server_App
//
//  Created by Care Farrar on 2/12/22.
//

import UIKit

class LessonCreation: UIViewController, UITextViewDelegate {

  @IBOutlet weak var lessonNameTextField: UITextField!
  @IBOutlet weak var lessonContentTextView: UITextView!
  var unit: Unit!
  var name: String = ""
  var content: String = ""
  override func viewDidLoad() {
    lessonContentTextView.delegate = self
  }
  
  @IBAction func LessonNameAdded(_ sender: UITextField) {
    name = sender.text ?? ""
  }
  
  @IBAction func AddClicked(_ sender: UIBarButtonItem) {
    if name != "" && content != "" {
      let lesson = Lesson(name: name, content: content)
      var lessons = unit.lessons
      if lessons?.count ?? 0 > 0 {
        lessons!.append(lesson)
      }
      let newUnit = Unit(name: unit.name, lessons: lessons)
      let course = CourseDataService.instance.getSelectedCourse()
      var updatedUnits: [Unit] = []
      if course.units?.count ?? 0 > 0 {
        for cunit in course.units! {
          if cunit.name == unit.name {
            updatedUnits.append(newUnit)
          } else {
            updatedUnits.append(cunit)
          }
        }
      }
      let updatedCourse = Course(id: course.id, name: course.name, shortDescription: course.shortDescription, price: course.price, creator: course.creator, units: updatedUnits)
      CourseDataService.instance.updateCourse(course: updatedCourse)
      CourseDataService.instance.setSelectedCourse(course: updatedCourse)
      navigationController?.popViewController(animated: true)
      
    }
  }
  
  func textViewDidChange(_ textView: UITextView) {
    content = lessonContentTextView.text ?? ""
  }
  
  func textViewDidBeginEditing(_ textView: UITextView) {
    if lessonContentTextView.text == "Lesson Content" {
      textView.text = ""
      textView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
  }
  func textViewDidEndEditing(_ textView: UITextView) {
    if lessonContentTextView.text == "" {
      textView.text = "Lesson Content"
      content = ""
      textView.textColor = #colorLiteral(red: 0.7490196824, green: 0.7490196824, blue: 0.7490196824, alpha: 1)
    }
  }
  
}
