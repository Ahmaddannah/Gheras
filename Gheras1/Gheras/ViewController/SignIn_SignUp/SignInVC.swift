//
//  ViewController2.swift
//  Gheras
//
//  Created by Ahmad MacBook on 15/12/2021.
//

import UIKit
import Firebase

class SignInVC: UIViewController {
   
  let screenW = UIScreen.main.bounds.size.width
  let screenH = UIScreen.main.bounds.size.height
   
  let db = Firestore.firestore()
  var userId = Auth.auth().currentUser?.uid
   
  var titlePage = UILabel()
  var textFieldEmail = UITextField()
  var textFieldPassword = UITextField()
  var signIn = UIButton()
  var labelCreat = UILabel()
  var signUp = UIButton()
  var forgetPassword = UIButton()
   
   
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    titlePage.frame = CGRect(x: self.screenW / 2.7 , y: screenH / 10, width: 90, height: 40)
    titlePage.text = "غِراس"
    titlePage.textAlignment = .center
    titlePage.layer.borderWidth = 2
    titlePage.backgroundColor = .green
    titlePage.layer.shadowOpacity = 0.5
    titlePage.layer.shadowRadius = 5
    titlePage.layer.shadowColor = UIColor.black.cgColor
    titlePage.layer.cornerRadius = 5
    titlePage.layer.masksToBounds = false
    titlePage.font = .systemFont(ofSize: 20, weight: .bold)
    view.addSubview(titlePage)
    //  ----------------------
    textFieldEmail.frame = CGRect(x: screenW / 8, y: screenH / 4, width: 300, height: 40)
    textFieldEmail.placeholder = "الايميل"
    textFieldEmail.textAlignment = .right
    textFieldEmail.layer.borderColor = UIColor.black.cgColor
    textFieldEmail.layer.borderWidth = 2
    textFieldEmail.borderStyle = .roundedRect
    textFieldEmail.layer.cornerRadius = 5.0
    textFieldEmail.textColor = .gray
    view.addSubview(textFieldEmail)
    //  -------------------------
    textFieldPassword.frame = CGRect(x: screenW / 8, y: screenH / 3, width: 300, height: 40)
    textFieldPassword.placeholder = "كلمة المرور"
    textFieldPassword.textAlignment = .right
    textFieldPassword.layer.borderColor = UIColor.black.cgColor
    textFieldPassword.layer.borderWidth = 2
    textFieldPassword.borderStyle = .roundedRect
    textFieldPassword.textColor = .gray
    view.addSubview(textFieldPassword)
    //  -----------------------------
    labelCreat .frame = CGRect(x: screenW / 16, y: screenH / 1.20, width: 200, height: 30)
    labelCreat .text = "Create new Account"
    labelCreat .textColor = .gray
    labelCreat.layer.shadowOpacity = 0.5
    labelCreat.layer.shadowRadius = 5
    labelCreat.layer.shadowColor = UIColor.black.cgColor
    labelCreat.layer.cornerRadius = 5
    labelCreat.layer.masksToBounds = false
    labelCreat .layer.borderColor = UIColor.black.cgColor
    labelCreat .layer.cornerRadius = 15
    labelCreat .textAlignment = .center
    view.addSubview(labelCreat )
    // -----------------
    signIn.frame = CGRect(x: screenW / 2.70, y: screenH / 2.15, width: 115, height: 40)
    signIn.setTitle("الدخول", for: .normal)
    signIn.setTitleColor(.black, for: .normal)
    signIn.layer.cornerRadius = 20
    signIn.backgroundColor = .green
    signIn.layer.shadowOpacity = 0.5
    signIn.layer.shadowRadius = 5
    signIn.layer.shadowColor = UIColor.black.cgColor
    signIn.layer.cornerRadius = 5
    signIn.layer.masksToBounds = false
    signIn.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
    view.addSubview(signIn)
    //  -------------------------------
    signUp.frame = CGRect(x: screenW / 4, y: screenH / 1.20, width: 300, height: 30)
    signUp.setTitle("Sign Up", for: .normal)
    signUp.layer.shadowOpacity = 0.5
    signUp.layer.shadowRadius = 5
    signUp.layer.shadowColor = UIColor.black.cgColor
    signUp.layer.cornerRadius = 5
    signUp.layer.masksToBounds = false
    signUp.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
    signUp.setTitleColor(.black, for: .normal)
    signUp.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
    view.addSubview(signUp)
    //------------------
    forgetPassword.frame = CGRect(x: screenW / 3.5 , y: screenH / 1.6 , width: 300, height: 30)
    forgetPassword.setTitle("نسيت كلمة المرور؟", for: .normal)
    forgetPassword.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
    forgetPassword.setTitleColor(.black, for: .normal)
    forgetPassword.addTarget(self, action: #selector(forgetPasswordAction), for: .touchUpInside)
    view.addSubview(forgetPassword)
  }
   
  override func viewDidAppear(_ animated: Bool) {
    if Auth.auth().currentUser != nil {
      let vc = ProfileVC()
      vc.modalPresentationStyle = .fullScreen
      present(vc, animated: true, completion: nil)
    }
  }
   
  @objc func signInAction(){
    if textFieldEmail.text != "" && textFieldPassword.text != "" {
      Auth.auth().signIn(withEmail: textFieldEmail.text!, password: textFieldPassword.text! , completion: { user, error in
         
        if error == nil {
          let vc = TabBarVC()
          vc.modalPresentationStyle = .fullScreen
          self.present(vc, animated: true, completion: nil)
          self.textFieldEmail.text = nil
          self.textFieldPassword.text = nil
           
        }else{
          let alert = UIAlertController(title: "Alert", message: error?.localizedDescription, preferredStyle: .alert)
          alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
          self.present(alert, animated: true, completion: nil)
        }
      })
    } else {
      let alert = UIAlertController(title: "missing information", message: "Please enter email and password", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
      present(alert, animated: true, completion: nil)
    }
  }
   
  @objc func signUpAction(){
    let vc = SignUpVC()
    vc.modalPresentationStyle = .fullScreen
    present(vc, animated: true, completion: nil)
  }
   
  @objc func forgetPasswordAction() {
    let vc = ForgotPasswordVC()
    vc.modalPresentationStyle = .fullScreen
    present(vc, animated: true, completion: nil)
     
  }
}
