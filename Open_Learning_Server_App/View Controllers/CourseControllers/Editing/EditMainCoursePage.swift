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
  /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
