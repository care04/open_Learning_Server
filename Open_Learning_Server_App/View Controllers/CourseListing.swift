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
    
    var courses = [Course(name: "HTML", shortDescription: "HTML short Description", price: 20)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        courseListsTable.delegate = self
        courseListsTable.dataSource = self
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
        for course in courses {
            cell.fillCell(course: course)
        }
        return cell
    }
    
    
}
