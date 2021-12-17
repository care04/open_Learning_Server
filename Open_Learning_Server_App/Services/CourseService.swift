//
//  CourseService.swift
//  Open_Learning_Server_App
//
//  Created by Care Farrar on 12/16/21.
//

import Foundation
class CourseDataService {
    static let instance = CourseDataService()
    private let regularCourses = [
        Course(name: "HTML", shortDescription: "Hyper Text Markup Language", price: 20.00, unit: [
            Unit(name: "What is Html", lessons: [Lesson(name: "", content: "")]),
            Unit(name: "Text Tags", lessons: [Lesson(name: "", content: "")])
        ]),
        Course(name: "HTML", shortDescription: "Hyper Text Markup Language", price: 20, unit: [
            Unit(name: "What is Html"),
                Unit(name: "Text Tags", lessons: [Lesson(name: "", content: "")])
        ])
    ]
    private let courses = [
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
    func getCourses() -> [updatedCourseModel] {
        return courses
    }
    func getRegularCourses() -> [Course] {
        return regularCourses
    }
}
