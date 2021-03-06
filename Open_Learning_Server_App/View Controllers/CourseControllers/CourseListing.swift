//
//  CourseListing.swift
//  Open_Learning_Server_App
//
//  Created by Care Farrar on 9/1/21.
//

import UIKit

class CourseListing: UIViewController {
    
    //MARK: Iboutlets
    @IBOutlet weak var courseListsTable: UITableView!
    
    var courses: [updatedCourseModel]!
    override func viewDidLoad() {
        super.viewDidLoad()
        courseListsTable.delegate = self
        courseListsTable.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        courses = CourseDataService.instance.getCourses()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIds.coursesToCourse {
            guard let courseController = segue.destination as? CoursePage else { return }
            courseController.course = (sender as? updatedCourseModel)!
        }
    }
}
extension CourseListing: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellVariables.courseCell, for: indexPath) as? CourseCell else {
            return UITableViewCell()
        }
        let course = courses[indexPath.row]
        cell.fillCell(course: course)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let course = courses[indexPath.row]
        performSegue(withIdentifier: segueIds.coursesToCourse, sender: course)
    }
}
