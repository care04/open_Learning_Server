//
//  OwnedCreatedCourses.swift
//  Open_Learning_Server_App
//
//  Created by Care Farrar on 9/1/21.
//

import UIKit

class OwnedCreatedCourses: UIViewController {

    var user: User = User(name: "", password: "")
    @IBOutlet weak var createdCoursesTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("user: ", user)
    }
}
extension OwnedCreatedCourses: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
