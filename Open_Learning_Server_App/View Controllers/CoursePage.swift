//
//  CoursePage.swift
//  Open_Learning_Server_App
//
//  Created by Care Farrar on 9/1/21.
//

import UIKit

class CoursePage: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var courseDescription: UILabel!
    @IBOutlet weak var lessonTable: UITableView!
    
    var course = Course(name: "", shortDescription: "", price: 0, lessons: [Lesson]())
    override func viewDidLoad() {
        super.viewDidLoad()
        lessonTable.delegate = self
        lessonTable.dataSource = self
        name.text = "Name: " + course.name
        price.text = "$" + String(course.price)
        courseDescription.text = "Description: " + course.shortDescription
    }
    override func viewDidAppear(_ animated: Bool) {
    }
    
}
extension CoursePage: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        course.lessons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellVariables.lessonCell, for: indexPath) as? LessonCell else {
            return UITableViewCell()
        }
        let lesson = course.lessons[indexPath.row]
        cell.fillLessonCell(lesson: lesson)
        return cell
    }
    
    
}
