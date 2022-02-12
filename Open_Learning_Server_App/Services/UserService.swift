//
//  UserService.swift
//  Open_Learning_Server_App
//
//  Created by Care Farrar on 12/20/21.
//

import Foundation

class UserDataSercice {
  static let instance = UserDataSercice()
  private var user = User(name: "", password: "")
  func setUser(user: User) {
    self.user = user
  }
  func getUser() -> User {
    return self.user
  }
  func getUsersCourses() -> [Course] {
    var usersCourses: [Course] = []
    let courses = CourseDataService.instance.getCourses()
    for course in courses {
      if course.creator.name == self.user.name {
        usersCourses.append(course)
      }
    }
    return usersCourses
  }
}
