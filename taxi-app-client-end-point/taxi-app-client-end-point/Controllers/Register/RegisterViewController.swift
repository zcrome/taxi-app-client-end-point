//
//  RegisterViewController.swift
//  taxi-app-client-end-point
//
//  Created by zcrome on 10/14/17.
//  Copyright © 2017 zcrome. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

  
  //**************************************
  //**** MARK: - Constraints outlets
  //**************************************
  
  //**************************************
  //**** MARK: - View outlets
  //**************************************
  
  
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var lastNameTextField: UITextField!
  @IBOutlet weak var phoneTextField: UITextField!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  //**************************************
  //**** MARK: - Local constans and variables
  //**************************************
  
  //**************************************
  //**** MARK: - ViewController override definitions
  //**************************************
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
  }
  
  //**************************************
  //**** MARK: - Actions and other outlets remaining
  //**************************************
  
  
  @IBAction func executeRegister(_ sender: UIButton) {
    
    
    guard
      let name = nameTextField.text,
      let lastName = lastNameTextField.text,
      let phone = phoneTextField.text,
      let email = emailTextField.text,
      let password = passwordTextField.text else{
        print("error con textfield")
        return
    }
    
    let parameters = ["name": name,
                      "lastName": lastName,
                      "phone": phone,
                      "email": email,
                      "password": password,
                      "state": "normal"]
    
    Services.sharedInstance.executeRegistrationOf(Client: parameters) { (response) in
      if response.status, let _ = response.clientId{
        self.performSegue(withIdentifier: "toLoginAfterRegister", sender: self)
      }else{
        print("ERROR register")
      }
    }
  }
  
  
  
  //**************************************
  //**** MARK: - Additional functions that may be require
  //**************************************

}
