//
//  OwnedCreatedCourses.swift
//  Open_Learning_Server_App
//
//  Created by Care Farrar on 9/1/21.
//

import UIKit

class OwnedCreatedCourses: UIViewController {

    var user: User = User(name: "George", password: "")
    
    var UsersCourses: [updatedCourseModel] = []
  @IBOutlet weak var navi: UINavigationItem!
  @IBOutlet weak var createdCoursesTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
      navi.hidesBackButton = true
        UsersCourses.append(contentsOf: UserDataSercice.instance.getUsersCourses())
        createdCoursesTable.reloadData()
        createdCoursesTable.delegate = self
        createdCoursesTable.dataSource = self
    }
  
  override func viewWillAppear(_ animated: Bool) {
    UsersCourses.removeAll()
    UsersCourses.append(contentsOf: UserDataSercice.instance.getUsersCourses())
    createdCoursesTable.reloadData()
  }
  
  func getData(user: User) -> [updatedCourseModel]{
    let courses = CourseDataService.instance.getCourses()
    var coursesToReturn: [updatedCourseModel] = []
    for course in courses {
      if course.creator.name == user.name{
        coursesToReturn.append(course)
      }
    }
    return coursesToReturn
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    if segue.identifier == segueIds.creatorToCourse {
//      guard let coursePage = segue.destination as? CoursePage else { return }
//      coursePage.course = (sender as? updatedCourseModel)!
//    }
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
      CourseDataService.instance.setSelectedCourse(course: course)
      performSegue(withIdentifier: segueIds.creatorToCourse, sender: nil)
    }
}
