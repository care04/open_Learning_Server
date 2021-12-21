//
//  CreationPage.swift
//  Open_Learning_Server_App
//
//  Created by Care Farrar on 12/20/21.
//

import UIKit

class CreationPage: UIViewController {

  //IBOutlets
  @IBOutlet weak var nameField: UITextField!
  @IBOutlet weak var descriptionField: UITextField!
  @IBOutlet weak var priceField: UITextField!
  @IBOutlet weak var saveCourseButton: UIButton!
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  @IBAction func SaveCourse(_ sender: Any) {
    if nameField.text != "" && descriptionField.text != "" && priceField.text != "" {
      guard let price = Double(priceField.text ?? "") else { return }
      let name = nameField.text
      let user = UserDataSercice.instance.getUser()
      let description = descriptionField.text
      let course = updatedCourseModel(id: 0, name: name!, shortDescription: description!, price: price, creator: user)
      CourseDataService.instance.addCourse(course: course)
      navigationController?.popViewController(animated: true)
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
