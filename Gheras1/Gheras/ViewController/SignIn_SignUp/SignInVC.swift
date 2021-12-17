//
//  ViewController2.swift
//  Gheras
//
//  Created by Ahmad MacBook on 15/12/2021.
//

import UIKit
import Firebase

class SignInVC: UIViewController {
    
    
    let db = Firestore.firestore()
    var userId = Auth.auth().currentUser?.uid
    
    var stackView = UIStackView()
    var textFieldEmail = UITextField()
    var textFieldPassword = UITextField()
    var forgetPassword = UIButton()
    var signIn = UIButton()
    
    var stackView2 = UIStackView()
    var labelCreat = UILabel()
    var signUp = UIButton()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        //Constants
        let width = view.frame.width - 100
        let height = view.frame.height - 400
        var y = 120.0
        
        //Adding SubViews
        view.addSubview(stackView)
        stackView.addSubview(textFieldEmail)
        stackView.addSubview(textFieldPassword)
        stackView.addSubview(forgetPassword)
        stackView.addSubview(signIn)
        stackView.addSubview(stackView2)
        stackView2.addSubview(labelCreat)
        stackView2.addSubview(signUp)
        
        // stack view
//        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.frame = CGRect(x: 0, y: y, width: width, height: height)
        stackView.center = view.center
//        stackView.backgroundColor = .gray
        
        // Email
        textFieldEmail.frame = CGRect(x: 0, y: y, width: width, height: height/10)
        textFieldEmail.placeholder = "الايميل"
        textFieldEmail.textAlignment = .right
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.textColor = .darkGray
        y+=textFieldEmail.frame.height
        y+=10
        
        //Password
        textFieldPassword.frame = CGRect(x: 0, y: y, width: width, height: height/10)
        textFieldPassword.placeholder = "كلمة المرور"
        textFieldPassword.textAlignment = .right
        textFieldPassword.borderStyle = .roundedRect
        textFieldPassword.textColor = .darkGray
        y+=textFieldPassword.frame.height

        //Forget
        forgetPassword.frame = CGRect(x:0, y: y, width: width, height: height/10)
        forgetPassword.setTitle("نسيت كلمة المرور؟", for: .normal)
        forgetPassword.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        forgetPassword.titleLabel?.textAlignment = .right
        forgetPassword.setTitleColor(.systemGreen, for: .normal)
        forgetPassword.addTarget(self, action: #selector(forgetPasswordAction), for: .touchUpInside)
        y+=forgetPassword.frame.height
        y+=60
        
        // Signin
        signIn.frame = CGRect(x: 0, y: y, width: width, height: height/10)
        signIn.setTitle("الدخول", for: .normal)
        signIn.setTitleColor(.white, for: .normal)
        signIn.layer.cornerRadius = 20
        signIn.backgroundColor = .systemGreen
        signIn.layer.masksToBounds = true
        signIn.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
        y+=signIn.frame.height
        y+=120
        
        // stack view 2
        stackView2.distribution = .fillEqually
        stackView2.axis = .horizontal
//        stackView2.spacing = 10
        stackView2.frame = CGRect(x: 0, y: y, width: width, height: height/10)
        
        // Create New
        labelCreat.frame = CGRect(x: 0, y: 0, width: width/2-10, height: height/10)
        labelCreat.text = "Create new account"
        labelCreat.textColor = .darkGray
        labelCreat.textAlignment = .center
        labelCreat.font = UIFont.systemFont(ofSize: 14)
        
        //signupBtn
        signUp.frame = CGRect(x: 0, y: y, width: width/2-10, height: height/10)
        signUp.titleLabel?.text = "Signup"
        signUp.titleLabel?.textColor = .darkGray
        signUp.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        signUp.titleLabel?.textAlignment = .center
        signUp.setTitleColor(.systemGreen, for: .normal)
        
        signUp.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil {
            let vc = TabBarVC()
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
    
    
    func setLablesConstraint() {
        
        //        let screenW = UIScreen.main.bounds.size.width
        //        let screenH = UIScreen.main.bounds.size.height
        
        //        //question1
        //        question1.frame = CGRect(x: 0, y: y, width: width, height: height/8)
        //        question1.font = UIFont.systemFont(ofSize: 18)
        //        question1.text = "السؤال الأول: من نحن؟"
        //        question1.textAlignment = .right
        //        question1.numberOfLines = 3
        //        y += question1.frame.height
        //        y += 10
        //        //answer1
        //        answer1.frame = CGRect(x: 0, y: y, width: width, height: height/6)
        //        answer1.font = UIFont.systemFont(ofSize: 16)
        //        answer1.text = "الاجابة هنا"
        //        answer1.numberOfLines = 4
        //        answer1.textAlignment = .right
        //        answer1.textColor = .systemGreen
        //        y += answer1.frame.height
        //        y += 20
        //        //question2
        //        question2.frame = CGRect(x: 0, y: y, width: width, height: height/8)
        //        question2.font = UIFont.systemFont(ofSize: 18)
        //        question2.text = "السؤال الثاني: من نحن؟"
        //        question2.textAlignment = .right
        //        question2.numberOfLines = 3
        //        y += question2.frame.height
        //        y += 10
        //        //answer2
        //        answer2.frame = CGRect(x: 0, y: y, width: width, height: height/6)
        //        answer2.font = UIFont.systemFont(ofSize: 16)
        //        answer2.text = "الاجابة هنا"
        //        answer2.numberOfLines = 4
        //        answer2.textAlignment = .right
        //        answer2.textColor = .systemGreen
        //        y += answer2.frame.height
        //        y += 20
        //        //question3
        //        question3.frame = CGRect(x: 0, y: y, width: width, height: height/8)
        //        question3.font = UIFont.systemFont(ofSize: 18)
        //        question3.text = "السؤال الثالث: من نحن؟"
        //        question3.textAlignment = .right
        //        question3.numberOfLines = 3
        //        y += question3.frame.height
        //        y += 10
        //        //answer3
        //        answer3.frame = CGRect(x: 0, y: y, width: width, height: height/6)
        //        answer3.font = UIFont.systemFont(ofSize: 16)
        //        answer3.text = "الاجابة هنا"
        //        answer3.numberOfLines = 4
        //        answer3.textAlignment = .right
        //        answer3.textColor = .systemGreen
        //        y += answer3.frame.height
        //        y += 20
        
    }
}
