//
//  Course.swift
//  Open_Learning_Server_App
//
//  Created by Care Farrar on 9/1/21.
//

import Foundation

struct Course {
    private(set) public var name: String
    private(set) public var shortDescription: String
    private(set) public var price: Double
    private(set) public var unit: [Unit]
}

struct updatedCourseModel {
    private(set) public var id: Double
    private(set) public var name: String
    private(set) public var shortDescription: String
    private(set) public var price: Double
    private(set) public var creator: User
    private(set) public var units: [Unit]
}

struct Unit {
    private(set) public var name: String
    private(set) public var lessons: [Lesson]?
}

struct Lesson {
    private(set) public var name: String
    private(set) public var content: String
}
