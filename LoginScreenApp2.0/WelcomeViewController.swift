//
//  WelcomeViewController.swift
//  LoginScreenApp2.0
//
//  Created by Евгения Максимова on 20.06.2023.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var welcomeLabelHello: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let hello = welcomeLabelHello else { return }
        welcomeLabel.text = "👻 Hello, \(hello)!🎉"
    }
    
    @IBAction func logOutButtonPressed() {
        dismiss(animated: true)
    }
}
