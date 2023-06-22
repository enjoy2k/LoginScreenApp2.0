//
//  ViewController.swift
//  LoginScreenApp2.0
//
//  Created by Евгения Максимова on 20.06.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!

    @IBOutlet weak var logInButton: UIButton!
    
    private let userName = "User"
    private let password = "Password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 10
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.welcomeLabelHello = userName
    }
    

    @IBAction func LogInButtonPressed() {
        if userNameTF.text != userName || passwordTF.text != password {
            showAlert(with: "Oops! 🫥", and: "Uncorrect UserName or Password")
        }
    }
    
    @IBAction func forgetUserDataPessed(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(with: "Упс!🥴", and: "Your UserName is '\(userName)'")
        : showAlert(with: "Упс!🥴", and: "Your Pass is '\(password)'")
    }
    
    @IBAction func uwnind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
}

extension ViewController {
    private func showAlert(with title: String, and massage: String) {
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
extension ViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            LogInButtonPressed()
            performSegue(withIdentifier: "welcomeViewController", sender: nil)
        }
        return true
    }
}
