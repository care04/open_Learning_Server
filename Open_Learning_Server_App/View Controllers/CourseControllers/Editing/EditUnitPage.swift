//
//  EditUnitPage.swift
//  Open_Learning_Server_App
//
//  Created by Care Farrar on 2/12/22.
//

import UIKit

class EditUnitPage: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var unitName: UITextField!
  @IBOutlet weak var unitLessonTable: UITableView!
  
  var unit: Unit!
    override func viewDidLoad() {
        super.viewDidLoad()
      unitName.text = unit.name
      unitLessonTable.delegate = self
      unitLessonTable.dataSource = self
    }
  
  override func viewWillAppear(_ animated: Bool) {
    if CourseDataService.instance.getSelectedCourse().units?.count ?? 0 > 0 {
      for cunit in CourseDataService.instance.getSelectedCourse().units! {
        if cunit.name == unit.name {
          unit = cunit
          unitLessonTable.reloadData()
          break
        }
      }
    }
  }
    
  @IBAction func saveChangesButton(_ sender: UIButton) {
    let selectedCourse = CourseDataService.instance.getSelectedCourse()
    if unitName.text != unit.name {
      var lessons: [Lesson] = []
      var updatedUnits: [Unit] = []
      for units in selectedCourse.units! {
        if units.name == unit.name {
          if units.lessons?.count ?? 0 > 0 {
            lessons = units.lessons!
          }
        }
      }
      for units in selectedCourse.units! {
        if units.name == unit.name {
          updatedUnits.append(Unit(name: unitName.text!, lessons: lessons))
        } else {
          updatedUnits.append(units)
        }
      }
      let updated = Course(id: selectedCourse.id, name: selectedCourse.name, shortDescription: selectedCourse.shortDescription, price: selectedCourse.price, creator: selectedCourse.creator, units: updatedUnits)
      CourseDataService.instance.updateCourse(course: updated)
      CourseDataService.instance.setSelectedCourse(course: updated)
      navigationController?.popViewController(animated: true)
    }
  }
  
  @IBAction func AddALessonButton(_ sender: Any) {
    performSegue(withIdentifier: segueIds.AddALessonSegue, sender: nil)
  }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == segueIds.AddALessonSegue {
        guard let LessonCreationController = segue.destination as? LessonCreation else { return }
        LessonCreationController.unit = unit
      }
    }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return unit.lessons?.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: cellVariables.editUnitLessonCell, for: indexPath) as? LessonCell else { return UITableViewCell() }
    guard let lesson = unit.lessons?[indexPath.row] else { return UITableViewCell() }
    cell.fillLessonCell(lesson: lesson)
    return cell
  }

}
