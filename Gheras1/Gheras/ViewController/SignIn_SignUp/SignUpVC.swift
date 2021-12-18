//
//  ViewController3.swift
//  Gheras
//
//  Created by Ahmad MacBook on 15/12/2021.
//

import UIKit


import UIKit
import Firebase

class SignUpVC: UIViewController {
    
    let db = Firestore.firestore()
      let imagePicker = UIImagePickerController()
      var imageName = "\(UUID().uuidString).png"
       
      let stackView = UIStackView()
      var myImage = UIImageView()
      let addPhoto = UIButton()
      var textFieldName = UITextField()
      var textFiledEmail = UITextField()
      var textFieldPassword = UITextField()
      let signUp = UIButton()
      var labelCreat = UILabel()
      var signIn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            imagePicker.delegate = self
            view.backgroundColor = .white
             
            let width = view.frame.width-100
            let height = view.frame.height-300
            var y = 0.0
             
            //Adding SubViews
            view.addSubview(stackView)
            stackView.addSubview(myImage)
            stackView.addSubview(addPhoto)
            stackView.addSubview(textFieldName)
            stackView.addSubview(textFiledEmail)
            stackView.addSubview(textFieldPassword)
            stackView.addSubview(signUp)
            stackView.addSubview(signIn)
             
             
            // stack view
           stackView.distribution = .fill
            stackView.axis = .vertical
            stackView.frame = CGRect(x: 0, y: 0, width: width, height: height)
            stackView.center = view.center
             
             
            //Profile Image
            myImage.frame = CGRect(x: width/4, y: 0, width: width/2, height: width/2)
            myImage.image = UIImage(systemName: "person.circle")
            myImage.layer.cornerRadius = myImage.frame.height/2
            myImage.clipsToBounds = true
            myImage.tintColor = .gray
            y+=myImage.frame.height
             
             
            //Add photo Btn
            addPhoto.frame = CGRect(x: 0, y: y, width: width, height: height/14)
            addPhoto.setTitle("اضغط لإضافة صورة", for: .normal)
            addPhoto.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            addPhoto.setTitleColor(.darkGray, for: .normal)
            addPhoto.addTarget(self, action: #selector(addPhotoAction), for: .touchUpInside)
            y+=addPhoto.frame.height
            y+=20
             
             
            //Name
            textFieldName.frame = CGRect(x: 0, y: y, width: width, height: height/14)
            textFieldName.borderStyle = .roundedRect
            textFieldName.placeholder = "الاسم"
            textFieldName.textAlignment = .right
            y+=textFieldName.frame.height
            y+=10
             
             
            //Email
            textFiledEmail.frame = CGRect(x: 0, y: y, width: width, height: height/14)
            textFiledEmail.borderStyle = .roundedRect
            textFiledEmail.placeholder = "البريد الالكتروني"
            textFiledEmail.textAlignment = .right
            y+=textFiledEmail.frame.height
            y+=10
             

            //Password
            textFieldPassword.frame = CGRect(x: 0, y: y, width: width, height: height/14)
            textFieldPassword.placeholder = "كلمة المرور"
            textFieldPassword.textAlignment = .right
            textFieldPassword.borderStyle = .roundedRect
            y+=textFieldPassword.frame.height
            y+=20


            //Signup
            signUp.frame = CGRect(x: 0, y: y, width: width, height: height/14)
            signUp.backgroundColor = #colorLiteral(red: 0.04236891121, green: 0.6102550626, blue: 0.2603748143, alpha: 1)
            signUp.layer.cornerRadius = signUp.frame.height/2
            signUp.setTitleColor(.white, for: .normal)
            signUp.setTitle("التسجيل", for: .normal)
            signUp.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
            y+=signUp.frame.height
            y+=100
             
              
            //Signin
            signIn.frame = CGRect(x: 0, y: y, width: width, height: height/14)
            signIn.setTitle("لديك حساب بالفعل؟ تسجيل الدخول", for: .normal)
            signIn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            signIn.setTitleColor(.darkGray, for: .normal)
            signIn.contentHorizontalAlignment = .center
            signIn.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
        
        
        hideKeyboardWhenTappedAround()
        
    }
    
    @objc func signInAction(){
        let vc = SignInVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    
    @objc func signUpAction() {
        if textFiledEmail.text != "" && textFieldPassword.text != "" {
            Auth.auth().createUser(withEmail: textFiledEmail.text!, password: textFieldPassword.text!) { user, Error in
                
                if Error == nil {
                    self.addUser(userId: (user?.user.uid)!)
                    let vc = TabBarVC()
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true, completion: nil)
                    
                } else{
                    let alert = UIAlertController(title: "تنبيه", message: Error?.localizedDescription, preferredStyle: .alert)
                                    alert.addAction(UIAlertAction(title: "حسناً", style: .default, handler: nil))
                                    self.present(alert, animated: true, completion: nil)
                }
            }
        } else {
            let alert = UIAlertController(title: "بيانات ناقصة", message: "الرجاء التأكد من إدخال البريد الإلكتروني و كلمة المرور", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "حسناً", style: .default, handler: nil))
                    present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func addPhotoAction() {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func addUser(userId: String) {
        if myImage.image != UIImage(systemName: "person.circle") {
            uploadImage()
        }
        
        self.db.collection("Users")
            .document(userId).setData(
                [
                    "email" : self.textFiledEmail.text!,
                    "name" : self.textFieldName.text!,
                    "userIcon": myImage.image == UIImage(systemName: "person.circle") ? "nil" : imageName,
                    "point" : 0
                ])
        {(error) in
            if error == nil {
                print("Added Succ..")
                
            }else {
                print(error!.localizedDescription)
                
            }
        }
        
    }
    
    func uploadImage() {
        
        let imagefolder = Storage.storage().reference().child("images")
        if let imageData = myImage.image?.jpegData(compressionQuality: 0.1) {
            imagefolder.child(imageName).putData(imageData, metadata: nil){
                (metaData , err) in
                if let error = err {
                    print(error.localizedDescription)
                }else {
                    print("تم رفع الصورة بنجاح")
                }
            }
        }
        
    }
    func hideKeyboardWhenTappedAround() {
       
      let tap = UITapGestureRecognizer(target: self, action: #selector(AddNewReqVC.dismissKeyboard))
      tap.cancelsTouchesInView = false
      view.addGestureRecognizer(tap)
     }
      
     @objc func dismissKeyboard() {
      view.endEditing(true)
     }
    
}


//MARK: -UIImagePickerController
extension SignUpVC: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        myImage.image = pickedImage
        picker.dismiss(animated: true, completion: nil)
    }
}
