//
// Forgotpassord.swift
// Gerase
//
// Created by Qahtani’s MacBook Pro on 12/15/21.
//
import UIKit
import Firebase
class ForgotPasswordVC: UIViewController {
    
    let stackView = UIStackView()
    let emailTextField = UITextField()
    let stackView2 = UIStackView()
    let returnBtn = UIButton()
    let cancelBtn = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setDesign()
    }
    
    func setDesign() {
        
        //Constants
        let width = view.frame.width-100
        let height = view.frame.height-1000
        var y = 0.0
        
        //Adding subViews
        view.addSubview(stackView)
        stackView.addSubview(emailTextField)
        stackView.addSubview(stackView2)
        stackView2.addSubview(returnBtn)
        stackView2.addSubview(cancelBtn)
        
        //StackView
        stackView.axis = .vertical
        stackView.frame = CGRect(x: 0, y: y, width: width, height: height)
        stackView.center = view.center
        
        
        //Email textfield
        emailTextField.frame = CGRect(x: 0, y: y, width: width, height: height/4)
        emailTextField.placeholder = "البريد الالكتروني"
        emailTextField.textAlignment = .right
        emailTextField.borderStyle = .roundedRect
        y+=emailTextField.frame.height
        y+=20
        
        
        //StackView2
        stackView2.frame = CGRect(x: 0, y: y, width: width, height: height/4)
        stackView2.distribution = .fillEqually
        stackView2.axis = .horizontal
        
        
        //Cancel Password Btn
        cancelBtn.frame = CGRect(x: 0, y: y, width: width/2-10, height: height/4)
        cancelBtn.backgroundColor = .white
        cancelBtn.layer.borderWidth = 1
        cancelBtn.layer.borderColor = #colorLiteral(red: 0.04236891121, green: 0.6102550626, blue: 0.2603748143, alpha: 1)
        cancelBtn.layer.cornerRadius = cancelBtn.frame.height/2
        cancelBtn.setTitleColor(#colorLiteral(red: 0.04236891121, green: 0.6102550626, blue: 0.2603748143, alpha: 1), for: .normal)
        cancelBtn.setTitle("الغاء", for: .normal)
        cancelBtn.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        
        //Return Password Btn
        returnBtn.frame = CGRect(x: cancelBtn.frame.width+10.0, y: y, width: width/2-10, height: height/4)
        returnBtn.backgroundColor = #colorLiteral(red: 0.04236891121, green: 0.6102550626, blue: 0.2603748143, alpha: 1)
        returnBtn.layer.cornerRadius = returnBtn.frame.height/2
        returnBtn.setTitleColor(.white, for: .normal)
        returnBtn.setTitle("استعادة", for: .normal)
        returnBtn.addTarget(self, action: #selector(resetPassword), for: .touchUpInside)
        
    }
    
    @objc func cancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func resetPassword(){
        Auth.auth().sendPasswordReset(withEmail: emailTextField.text!) { (error) in
            if error != nil {
                self.dismiss(animated: true, completion: nil)
                let alert = UIAlertController(title: "تنبيه", message: error?.localizedDescription, preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: "حسناً", style: .default, handler: nil))
                                self.present(alert, animated: true, completion: nil)
            } else {

            }
        }
    }
}






