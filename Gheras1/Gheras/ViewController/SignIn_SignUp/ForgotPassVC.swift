//
// Forgotpassord.swift
// Gerase
//
// Created by Qahtani’s MacBook Pro on 12/15/21.
//
import UIKit
import Firebase
class ForgotPasswordVC: UIViewController {
 let screenW = UIScreen.main.bounds.width
 let screenH = UIScreen.main.bounds.height
 let myLabel = UILabel()
 let myTextFiled = UITextField()
 let forgotPass = UIButton()
 let mystack = UIStackView()
 override func viewDidLoad() {
  super.viewDidLoad()
  view.backgroundColor = .white
  view.addSubview(mystack)
  myLabel.frame = CGRect(x: screenW / 8, y: screenH / 4, width: 300, height: 40)
     myLabel.text = "استرجاع كلمة المرور"
  myLabel.layer.shadowOpacity = 0.5
  myLabel.layer.shadowRadius = 5
   myLabel.layer.shadowColor = UIColor.black.cgColor
   myLabel.layer.cornerRadius = 5
   myLabel.layer.masksToBounds = false
  myLabel.textAlignment = .center
  myLabel.layer.borderWidth = 0.1
  myLabel.backgroundColor = .white
  mystack.addSubview(myLabel)
//  --------------
  myTextFiled.frame = CGRect(x: screenW / 8, y: screenH / 3, width: 300, height: 40)
  myTextFiled.placeholder = "الايميل"
     myTextFiled.textAlignment = .right
  myTextFiled.layer.borderColor = UIColor.black.cgColor
  myTextFiled.layer.borderWidth = 0.1
  myTextFiled.layer.shadowOpacity = 0.5
  myTextFiled.layer.shadowRadius = 5
  myTextFiled.layer.shadowColor = UIColor.black.cgColor
  myTextFiled.layer.cornerRadius = 5
  myTextFiled.borderStyle = .roundedRect
  myTextFiled.textColor = .gray
  mystack.addSubview(myTextFiled)
//  ----------------
  forgotPass.frame = CGRect(x: screenW / 2.70, y: screenH / 2.15, width: 115, height: 40)
  forgotPass.setTitle("الدخول", for: .normal)
  forgotPass.setTitleColor(.black, for: .normal)
  forgotPass.layer.cornerRadius = 20
  forgotPass.backgroundColor = .red
  forgotPass.layer.shadowOpacity = 0.5
   forgotPass.layer.shadowRadius = 5
   forgotPass.layer.shadowColor = UIColor.black.cgColor
  forgotPass.layer.cornerRadius = 5
  forgotPass.layer.masksToBounds = false
  forgotPass.addTarget(self, action: #selector(backSignIn), for: .touchUpInside)
  mystack.addSubview(forgotPass)
 }
 @objc func backSignIn(){
   Auth.auth().sendPasswordReset(withEmail: myTextFiled.text!) { (error) in
    if error != nil {
      self.dismiss(animated: true, completion: nil)
    }
  }
 }
}






