//
//  SignInPage.swift
//  Open_Learning_Server_App
//
//  Created by Care Farrar on 12/16/21.
//

import UIKit

class SignInPage: UIViewController, UITextFieldDelegate {

    var user: User = User(name: "", password: "")
    var name: String = ""
    var password: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func passwordText(_ sender: UITextField) {
        password = sender.text ?? ""
        self.user.password = sender.text ?? ""
    }
    @IBAction func NameText(_ sender: UITextField) {
        name = sender.text ?? ""
        self.user.name = sender.text ?? ""
    }
    
    @IBAction func SignInClicked(_ sender: UIButton) {
        if name == "George" && password != "" {
            performSegue(withIdentifier: "SigninSegue", sender: user)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIds.SigninSegue {
            guard let UsersPage = segue.destination as? OwnedCreatedCourses else { return }
            UsersPage.user = (sender as? User)!
        }
    }

}
