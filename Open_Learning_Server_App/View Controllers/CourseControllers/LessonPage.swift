//
//  LessonPage.swift
//  Open_Learning_Server_App
//
//  Created by Care Farrar on 12/17/21.
//

import UIKit

class LessonPage: UIViewController {
  @IBOutlet weak var lessonName: UILabel!
  @IBOutlet weak var lessonContent: UILabel!
  
  var lesson = Lesson(name: "", content: "")

  override func viewDidLoad() {
    super.viewDidLoad()
    lessonName.text = lesson.name
    lessonContent.text = lesson.content
      // Do any additional setup after loading the view.
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
