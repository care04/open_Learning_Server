//
//  EditMainCoursePage.swift
//  Open_Learning_Server_App
//
//  Created by Care Farrar on 12/23/21.
//

import UIKit

class EditMainCoursePage: UIViewController {
  
  @IBOutlet weak var naviationBar: UINavigationItem!
  @IBOutlet weak var nameField: UITextField!
  @IBOutlet weak var descriptionTextView: UITextView!
  @IBOutlet weak var priceField: UITextField!
  @IBOutlet weak var unitTable: UITableView!
  var course: updatedCourseModel!
  var price: Double = 0
  var name = ""
  var shortDescription = ""
  override func viewDidLoad() {
        super.viewDidLoad()
    nameField.text = name
    descriptionTextView.text = shortDescription
    priceField.text = String(price)
    naviationBar.hidesBackButton = true
    unitTable.delegate = self
    unitTable.dataSource = self
  }
    
  @IBAction func priceEditid(_ sender: UITextField) {
      if sender.text?.count ?? 0 >= 1 {
        for item in sender.text! {
          if !item.isNumber {
            sender.text?.remove(at: sender.text!.firstIndex(of: item)!)
          } else {
            price = Double(sender.text!) ?? 0
          }
        }
      }
  }
  @IBAction func saveClicked(_ sender: UIButton) {
    let anem = nameField.text ?? name
    let short = descriptionTextView.text ?? shortDescription
    let updatedCourse = updatedCourseModel(id: course.id, name: anem, shortDescription: short, price: price, creator: course.creator, units: course.units)
    CourseDataService.instance.setSelectedCourse(course: updatedCourse)
    CourseDataService.instance.updateCourse(course: updatedCourse)
    navigationController?.popViewController(animated: true)
  }
  @IBAction func addUnitClicked(_ sender: UIButton) {
    print("add a unit")
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == segueIds.fromEditCourseToUnit {
      guard let controller = segue.destination as? UnitPage else { return }
      controller.unit = sender as! Unit
    }
  }
}
extension EditMainCoursePage: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    course.units?.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "unitEditName", for: indexPath) as? UnitCell else {
      return UITableViewCell()
    }
    guard let unit = course.units?[indexPath.row] else { return UITableViewCell() }
    cell.fillUnitCell(unit: unit)
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let unit = CourseDataService.instance.getSelectedCourse().units?[indexPath.row] else { return }
    performSegue(withIdentifier: segueIds.fromEditCourseToUnit, sender: unit)
  }
}
