//
//  CourseService.swift
//  Open_Learning_Server_App
//
//  Created by Care Farrar on 12/16/21.
//

import Foundation
class CourseDataService {
  static let instance = CourseDataService()
  private var courses = [
      Course(id: 3, name: "HTML Basic", shortDescription: "Hyper Text Markup Language Basics", price: 30, creator: User(name: "George", password: ""), units: [
          Unit(name: "What is html", id: 1),
          Unit(name: "Getting Started", lessons: [
              Lesson(name: "Lesson One", content: "lesson Content for lesson one"),
              Lesson(name: "Lesson Two", content: "Lesson content for lesson two in getting started unit")
          ], id: 2),
          Unit(name: "text tags", lessons: [
            Lesson(name: "Lesson Text Tags 1", content: "content for first lesson in text tags"),
            Lesson(name: "Lesson Text Tags 2", content: "content for second lesson in text tags"),
            Lesson(name: "Lesson Text Tags 3", content: "Content for lesson 3 in text tags")
          ], id: 3)
      ]),
      Course(id: 2, name: "Java Advanced", shortDescription: "Dont know what Java Stands for", price: 20, creator: User(name: "Duelvin", password: ""), units: [
        Unit(name: "What is Java", id: 1),
        Unit(name: "Java Basics", id: 2),
        Unit(name: "Java Basic Advanced", id: 3),
        Unit(name: "Java intermediate", id: 4),
        Unit(name: "Java intermediate Advanced", id: 5),
        Unit(name: "Java Advanced", id: 6)
        ])
  ]
  private var selectedCourse: Course?
  private var selectedUnit: Unit?
  func setSelectedCourse(course: Course) {
    selectedCourse = course
  }
  func setSelectedUnit(unit: Unit) {
    selectedUnit = unit
  }
  func getSelectedUnit() -> Unit {
    return selectedUnit ?? Unit(name: "", id: 0)
  }
  func getSelectedCourse() -> Course {
    return selectedCourse ?? Course(id: 0, name: "", shortDescription: "", price: 0.0, creator: User(name: "", password: ""))
  }
  func getCourses() -> [Course] {
      return courses
  }
  func addCourse(course: Course) {
    CourseDataService.instance.courses.append(course)
  }
  func updateCourse(course: Course) {
    var index = -1
    for item in courses {
      index += 1
      if item.id == course.id {
        CourseDataService.instance.courses[index] = course
      }
    }
  }
}
