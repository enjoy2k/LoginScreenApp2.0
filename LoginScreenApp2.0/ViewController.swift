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
        welcomeVC.welcomeLabelHello = userNameTF.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super .touchesBegan(touches, with: event)
    }

    @IBAction func LogInButtonPressed() {
//        guard let text = userNameTF.text, !text.isEmpty else { return }
//        guard let textPass = passwordTF.text, !textPass.isEmpty else { return }
        if userNameTF.text != userName || passwordTF.text != password {
            showAlert(with: "Oops! 🫥", and: "Uncorrect UserName or Password")
        }
    }
    
    @IBAction func forgetUserNameButtonPressed() {
        showAlert(with: "Упс!🥴", and: "Your UserName is '\(userName)'")
    }
    @IBAction func forgetPassButtonPressed() {
        showAlert(with: "Упс!🥴", and: "Your Pass is '\(password)'")
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

