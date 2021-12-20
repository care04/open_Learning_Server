//
//  LessonPage.swift
//  Open_Learning_Server_App
//
//  Created by Care Farrar on 12/16/21.
//

import UIKit

class UnitPage: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  //IBOUtlets
    @IBOutlet weak var lessonTable: UITableView!
  
    //IBOutlets
    @IBOutlet weak var unitName: UILabel!
  
    var unit = Unit(name: "", lessons: [])
    
    override func viewDidLoad() {
      super.viewDidLoad()
      unitName.text = unit.name
      lessonTable.delegate = self
      lessonTable.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIds.UnitToLesson{
        guard let lessonPage = segue.destination as? LessonPage else { return }
        lessonPage.lesson = (sender as? Lesson)!
      }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return unit.lessons?.count ?? 0
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      if unit.lessons?.count ?? 0 > 0 {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellVariables.lessonCell, for: indexPath) as? LessonCell else {
          return UITableViewCell()
        }
        let lesson = unit.lessons![indexPath.row]
        cell.fillLessonCell(lesson: lesson)
        print(lesson)
        return cell
      } else {
        return UITableViewCell()
      }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let lesson = unit.lessons![indexPath.row]
      performSegue(withIdentifier: segueIds.UnitToLesson, sender: lesson)
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
