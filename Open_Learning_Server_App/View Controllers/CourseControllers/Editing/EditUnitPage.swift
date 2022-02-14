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
    
  @IBAction func saveChangesButton(_ sender: UIButton) {
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
