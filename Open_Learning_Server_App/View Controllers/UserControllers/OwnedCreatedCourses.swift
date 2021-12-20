//
//  OwnedCreatedCourses.swift
//  Open_Learning_Server_App
//
//  Created by Care Farrar on 9/1/21.
//

import UIKit

class OwnedCreatedCourses: UIViewController {

    var user: User = User(name: "", password: "")
    
    var UsersCourses: [updatedCourseModel] = []
    @IBOutlet weak var createdCoursesTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
      let courses = CourseDataService.instance.getCourses()
      for course in courses {
        if course.creator.name == "George"{
          UsersCourses.append(course)
          createdCoursesTable.reloadData()
        }
      }
      createdCoursesTable.delegate = self
      createdCoursesTable.dataSource = self
    }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == segueIds.creatorToCourse {
      guard let coursePage = segue.destination as? CoursePage else { return }
      coursePage.course = (sender as? updatedCourseModel)!
    }
  }
}
extension OwnedCreatedCourses: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return UsersCourses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: cellVariables.usersCourses, for: indexPath) as? CourseCell else { return UITableViewCell() }
      cell.fillCell(course: UsersCourses[indexPath.row])
      return cell
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let course = UsersCourses[indexPath.row]
      performSegue(withIdentifier: segueIds.creatorToCourse, sender: course)
    }
}
