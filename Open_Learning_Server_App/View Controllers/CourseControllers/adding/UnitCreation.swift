//
//  UnitCreation.swift
//  Open_Learning_Server_App
//
//  Created by Care Farrar on 12/24/21.
//

import UIKit

class UnitCreation: UIViewController {

  @IBOutlet weak var save: UIBarButtonItem!
  var name = ""
  override func viewDidLoad() {
      super.viewDidLoad()
    save.isEnabled = false
        // Do any additional setup after loading the view.
    }
    
  @IBAction func saveUnitClicked(_ sender: Any) {
    let currentCourse = CourseDataService.instance.getSelectedCourse()
    var units = currentCourse.units
    if units?.count ?? 0 > 0 {
      if currentCourse.units?.count ?? 0 > 0 {
        units!.append(Unit(name: name, id: currentCourse.units!.count + 1))
      } else {
        units!.append(Unit(name: name, id: 1))
      }
      let newCourse = Course(id: currentCourse.id, name: currentCourse.name, shortDescription: currentCourse.shortDescription, price: currentCourse.price, creator: currentCourse.creator, units: units)
      CourseDataService.instance.updateCourse(course: newCourse)
      CourseDataService.instance.setSelectedCourse(course: newCourse)
      navigationController?.popViewController(animated: true)
    }
  }
  
  @IBAction func unitNameTyped(_ sender: UITextField) {
    if sender.text?.count ?? 0 > 0 {
      name = sender.text!
      save.isEnabled = true
    } else {
      save.isEnabled = false
    }
  }
  /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
