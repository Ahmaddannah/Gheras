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
    let screenW = UIScreen.main.bounds.width
     let screenH = UIScreen.main.bounds.height
      
     let signUp = UIButton()
     var textFieldName = UITextField()
     var textFiledEmail = UITextField()
     var textFieldPassword = UITextField()
     var myImage = UIImageView()
     let imagePicker = UIImagePickerController()
     var labelCreat = UILabel()
     var signIn = UIButton()
     let addPhoto = UIButton()
      
     let db = Firestore.firestore()
     var imageName = "\(UUID().uuidString).png"
      
     override func viewDidLoad() {
       super.viewDidLoad()
       imagePicker.delegate = self
       view.backgroundColor = .white
       //  -----
       signUp.frame = CGRect(x: screenW / 3, y: screenH / 1.80, width: 150, height: 30)
       signUp.backgroundColor = .green
       signUp.layer.shadowOpacity = 0.5
       signUp.layer.shadowRadius = 5
       signUp.layer.shadowColor = UIColor.black.cgColor
       signUp.layer.cornerRadius = 5
       signUp.layer.masksToBounds = false
       signUp.setTitleColor(.black, for: .normal)
       signUp.setTitle("دخول", for: .normal)
       signUp.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
       view.addSubview(signUp)
       //  ---------
       textFieldName.frame = CGRect(x: screenW / 8, y: screenH / 3.20, width: 300, height: 40)
       textFieldName.placeholder = "الاسم"
       textFieldName.textAlignment = .right
       textFieldName.layer.backgroundColor = UIColor.white.cgColor
       textFieldName.layer.borderWidth = 1
       view.addSubview(textFieldName)
       // ----------------
       textFiledEmail.frame = CGRect(x: screenW / 8, y: screenH / 2.60, width: 300, height: 40)
       textFiledEmail.placeholder = "الايميل"
       textFiledEmail.textAlignment = .right
       textFiledEmail.layer.backgroundColor = UIColor.white.cgColor
       textFiledEmail.layer.borderWidth = 1
       view.addSubview(textFiledEmail)
       //  ---------------
       textFieldPassword.frame = CGRect(x: screenW / 8, y: screenH / 2.20, width: 300, height: 40)
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
       //  --------------
       myImage.frame = CGRect(x: 50, y: 50, width: screenW - 100, height: screenW - 250)
       myImage.image = UIImage(systemName: "person.circle")
       view.addSubview(myImage)
       //  -----------------------------
       labelCreat .frame = CGRect(x: screenW / 16, y: screenH / 1.20, width: 200, height: 30)
       labelCreat .text = "Already have an account?"
       labelCreat .textColor = .gray
       labelCreat.layer.shadowOpacity = 0.5
       labelCreat.layer.shadowRadius = 5
       labelCreat.layer.shadowColor = UIColor.black.cgColor
       labelCreat.layer.cornerRadius = 5
       labelCreat.layer.masksToBounds = false
       labelCreat .layer.borderColor = UIColor.black.cgColor
       labelCreat .layer.cornerRadius = 15
       labelCreat .textAlignment = .center
       view.addSubview(labelCreat)
       //  -------------------------------
       signIn.frame = CGRect(x: screenW / 4, y: screenH / 1.20, width: 300, height: 30)
       signIn.setTitle("Sign In", for: .normal)
       signIn.layer.shadowOpacity = 0.5
       signIn.layer.shadowRadius = 5
       signIn.layer.shadowColor = UIColor.black.cgColor
       signIn.layer.cornerRadius = 5
       signIn.layer.masksToBounds = false
       signIn.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
       signIn.setTitleColor(.black, for: .normal)
       signIn.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
       view.addSubview(signIn)
       //---------------------
       addPhoto.frame = CGRect(x: screenW / 2 , y: screenH / 3.5 , width: 100, height: 30)
       addPhoto.setTitle("اضافة صورة", for: .normal)
       addPhoto.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
       addPhoto.setTitleColor(.black, for: .normal)
       addPhoto.addTarget(self, action: #selector(addPhotoAction), for: .touchUpInside)
       view.addSubview(addPhoto)
        
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
           let alert = UIAlertController(title: "Alert", message: Error?.localizedDescription, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
           self.present(alert, animated: true, completion: nil)
         }
       }
     } else {
       let alert = UIAlertController(title: "missing information", message: "Please enter email and password", preferredStyle: .alert)
       alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
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

   }


   //MARK: -UIImagePickerController
   extension SignUpVC: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
     func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
       myImage.image = pickedImage
       picker.dismiss(animated: true, completion: nil)
     }
   }
