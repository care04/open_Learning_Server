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
      updatedCourseModel(id: 3, name: "HTML Basic", shortDescription: "Hyper Text Markup Language Basics", price: 30, creator: User(name: "George", password: ""), units: [
          Unit(name: "What is html"),
          Unit(name: "Getting Started", lessons: [
              Lesson(name: "Lesson One", content: "lesson Content for lesson one"),
              Lesson(name: "Lesson Two", content: "Lesson content for lesson two in getting started unit")
          ]),
          Unit(name: "text tags", lessons: [
              Lesson(name: "Lesson Text Tags 1", content: "content for first lesson in text tags"),
              Lesson(name: "Lesson Text Tags 2", content: "content for second lesson in text tags"),
              Lesson(name: "Lesson Text Tags 3", content: "Content for lesson 3 in text tags")
          ])
      ]),
      updatedCourseModel(id: 2, name: "Java Advanced", shortDescription: "Dont know what Java Stands for", price: 20, creator: User(name: "Duelvin", password: ""), units: [
          Unit(name: "What is Java"),
          Unit(name: "Java Basics"),
          Unit(name: "Java Basic Advanced"),
          Unit(name: "Java intermediate"),
          Unit(name: "Java intermediate Advanced"),
          Unit(name: "Java Advanced")
        ])
  ]
  private var selectedCourse: updatedCourseModel?
  func setSelectedCourse(course: updatedCourseModel) {
    selectedCourse = course
  }
  func getSelectedCourse() -> updatedCourseModel {
    return selectedCourse ?? updatedCourseModel(id: 0, name: "", shortDescription: "", price: 0.0, creator: User(name: "", password: ""))
  }
  func getCourses() -> [updatedCourseModel] {
      return courses
  }
  func addCourse(course: updatedCourseModel) {
    courses.append(course)
  }
  func updateCourse(course: updatedCourseModel) {
    var index = -1
    for item in courses {
      index += 1
      if item.id == course.id {
        courses[index] = course
      }
    }
  }
}
