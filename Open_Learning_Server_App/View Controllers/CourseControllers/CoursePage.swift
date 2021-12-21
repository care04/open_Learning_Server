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
    @IBOutlet weak var Edit: UIButton!
  
    var course = updatedCourseModel(id: 0, name: "", shortDescription: "", price: 0, creator: User(name: "", password: ""), units: [Unit(name: "")])
    override func viewDidLoad() {
        super.viewDidLoad()
        lessonTable.delegate = self
        lessonTable.dataSource = self
        name.text = "Name: " + course.name
        price.text = "Price: " + "$" + String(course.price) + "0"
        courseDescription.text = "Description: " + course.shortDescription
    }
  override func viewWillAppear(_ animated: Bool) {
    hiddenEditButton(button: Edit, course: course)
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == segueIds.courseToUnit {
      guard let unitController = segue.destination as? UnitPage else { return }
      unitController.unit = (sender as? Unit)!
    }
  }
    
}
extension CoursePage: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return course.units?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellVariables.UnitCell, for: indexPath) as? UnitCell else {
            return UITableViewCell()
        }
      guard let unit = course.units?[indexPath.row] else { return UITableViewCell() }
        cell.fillUnitCell(unit: unit)
        return cell
    }
    
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let unit = course.units?[indexPath.row]
    performSegue(withIdentifier: segueIds.courseToUnit, sender: unit)
  }
}
