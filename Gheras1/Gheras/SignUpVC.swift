//
//  ViewController3.swift
//  Gheras
//
//  Created by Ahmad MacBook on 15/12/2021.
//

import UIKit

class SignUpVC: UIViewController {
    
    
    let screenW = UIScreen.main.bounds.width
      let screenh = UIScreen.main.bounds.height
      let signIn = UIButton()
      var textFieldName = UITextField()
      var textFiledEmail = UITextField()
      var textFieldPassword = UITextField()
      var myImage = UIImageView()
      override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    //    -----
        signIn.frame = CGRect(x: screenW / 3, y: screenh / 1.80, width: 150, height: 30)
        signIn.backgroundColor = .green
        signIn.layer.shadowOpacity = 0.5
         signIn.layer.shadowRadius = 5
         signIn.layer.shadowColor = UIColor.black.cgColor
         signIn.layer.cornerRadius = 5
        signIn.layer.masksToBounds = false
        signIn.setTitleColor(.black, for: .normal)
        signIn.setTitle("دخول", for: .normal)
        signIn.addTarget(self, action: #selector(signIIn), for: .touchUpInside)
        view.addSubview(signIn)
    //    ---------
        textFieldName.frame = CGRect(x: screenW / 8, y: screenh / 3.20, width: 300, height: 40)
        textFieldName.placeholder = "الاسم"
        textFieldName.textAlignment = .right
        textFieldName.layer.backgroundColor = UIColor.white.cgColor
        textFieldName.layer.borderWidth = 1
        view.addSubview(textFieldName)
    //  ----------------
        textFiledEmail.frame = CGRect(x: screenW / 8, y: screenh / 2.60, width: 300, height: 40)
        textFiledEmail.placeholder = "الايميل"
        textFiledEmail.textAlignment = .right
        textFiledEmail.layer.backgroundColor = UIColor.white.cgColor
        textFiledEmail.layer.borderWidth = 1
        view.addSubview(textFiledEmail)
    //    ---------------
        textFieldPassword.frame = CGRect(x: screenW / 8, y: screenh / 2.20, width: 300, height: 40)
        textFieldPassword.placeholder = "كلمة المرور"
        textFieldPassword.textAlignment = .right
        textFieldPassword.layer.backgroundColor = UIColor.white.cgColor
        textFieldPassword.layer.borderWidth = 1
       textFieldPassword.layer.shadowOpacity = 0.5
         textFieldPassword.layer.shadowRadius = 5
         textFieldPassword.layer.shadowColor = UIColor.black.cgColor
         textFieldPassword.layer.cornerRadius = 5
         textFieldPassword.layer.masksToBounds = false
        view.addSubview(textFieldPassword)
    //    --------------
        myImage.frame = CGRect(x: 50, y: 50, width: screenW - 100, height: screenW - 250)
        myImage.image = UIImage(systemName: "person.circle.fill")
        view.addSubview(myImage)
      }
      @objc func signIIn(){
        dismiss(animated: true, completion: nil)
      }
    }


