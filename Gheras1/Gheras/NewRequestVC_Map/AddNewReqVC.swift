//
//  ViewController8.swift
//  Gheras
//
//  Created by Ahmad MacBook on 15/12/2021.
//

import UIKit

class AddNewReqVC: UIViewController , UITextFieldDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
       
      // viewController
      let firstView = UIView(frame: CGRect(x: 0, y: 120, width: 400, height: 700))
      let secondView = UIView(frame: CGRect(x: 0, y: 120, width: 400, height: 700))
      let mySegment = UISegmentedControl (items: ["موقع عام","موقع خاص"])
      //
       
      // firstVC
      let nameLabel = UILabel(frame: CGRect(x: 300, y: 20, width: 200, height: 60))
      let nameField = UITextField(frame: CGRect(x: 40, y: 70, width: 300, height: 40))
      let addresLabel = UILabel(frame: CGRect(x: 300, y: 120, width: 200, height: 60))
      let addresField = UITextField(frame: CGRect(x: 40, y: 170, width: 300, height: 40))
      let giftLabel = UILabel(frame: CGRect(x: 250, y: 250, width: 200, height: 30))
      let gift = UIPickerView(frame: CGRect(x: 40, y: 220, width: 150, height: 100))
      let giftAray = [
        "نعم",
        "لا"
      ]
      let cameraImage = UIImageView(frame: CGRect(x: 100, y: 400, width: 200, height: 100))
      let cameraButton = UIButton(frame: CGRect(x: 100, y: 510, width: 200, height: 40))
      let sendButton = UIButton(frame: CGRect(x: 100, y: 600, width: 200, height: 60))
       
      //
       
      // secondVC
      let nameLabel2 = UILabel(frame: CGRect(x: 300, y: 20, width: 200, height: 30))
      let nameField2 = UITextField(frame: CGRect(x: 40, y: 60, width: 300, height: 40))
      let addresLabel2 = UILabel(frame: CGRect(x: 300, y: 110, width: 200, height: 30))
      let addresField2 = UITextField(frame: CGRect(x: 40, y: 150, width: 300, height: 40))
      let phoneLabel = UILabel(frame: CGRect(x: 260, y: 200, width: 200, height: 30))
      let phoneField = UITextField(frame: CGRect(x: 40, y: 240, width: 300, height: 40))
       
      let nextButton = UIButton(frame: CGRect(x: 100, y: 600, width: 200, height: 40))
       
      let cameraImage2 = UIImageView(frame: CGRect(x: 100, y: 400, width: 200, height: 100))
      let cameraButton2 = UIButton(frame: CGRect(x: 100, y: 510, width: 200, height: 40))
       
      //
      override func viewDidLoad() {
        super.viewDidLoad()
         
        // view
        view.backgroundColor = .systemGray2
        view.addSubview(secondView)
        view.addSubview(firstView)
        view.addSubview(mySegment)
        mySegment.frame = CGRect(x: 40, y: 70, width: 300, height: 50)
        mySegment.addTarget(self, action: #selector(segmentedValueChanged(_:)), for: .valueChanged)
        mySegment.selectedSegmentIndex = 0
        //
         
        // firstVc
        firstView.backgroundColor = .systemGray2
         
        firstView.addSubview(nameLabel)
        firstView.addSubview(nameField)
        firstView.addSubview(addresLabel)
        firstView.addSubview(addresField)
        firstView.addSubview(giftLabel)
        firstView.addSubview(gift)
        firstView.addSubview(cameraImage)
        firstView.addSubview(cameraButton)
        firstView.addSubview(sendButton)
         
        nameLabel.text = "الاسم"
        nameField.placeholder = "الاسم"
        nameField.textAlignment = .right
        nameField.backgroundColor = .lightText
        nameField.delegate = self
        addresLabel.text = "العنوان"
        addresField.placeholder = "العنوان"
        addresField.delegate = self
        addresField.textAlignment = .right
        addresField.backgroundColor = .lightText
        giftLabel.text = "ارسال هدية"
        gift.delegate = self
        gift.dataSource = self
        cameraImage.image = UIImage(systemName: "camera")
        cameraImage.tintColor = .black
        cameraButton.setTitle(" الكميرا ", for: .normal)
        cameraButton.backgroundColor = .white
        cameraButton.setTitleColor(.blue, for: .normal)
        cameraButton.titleLabel?.font = .boldSystemFont(ofSize: 15)
        cameraButton.layer.cornerRadius = 10
        cameraButton.layer.cornerRadius = cameraButton.frame.height/2
        cameraButton.clipsToBounds = true
        cameraButton.addTarget(self, action: #selector (takePicture), for: .touchDown)
        sendButton.setTitle("ارسل الطلب ", for: .normal)
        sendButton.backgroundColor = .white
        sendButton.setTitleColor(.blue, for: .normal)
        sendButton.titleLabel?.font = .boldSystemFont(ofSize: 15)
        sendButton.layer.cornerRadius = 10
        sendButton.layer.cornerRadius = sendButton.frame.height/2
        sendButton.clipsToBounds = true
        sendButton.addTarget(self, action: #selector (sendOrder), for: .touchDown)
         
        //
         
         
         
         
        // secondVc
        secondView.backgroundColor = .systemGray2
         
        secondView.addSubview(nameLabel2)
        secondView.addSubview(nameField2)
        secondView.addSubview(addresLabel2)
        secondView.addSubview(addresField2)
        secondView.addSubview(phoneLabel)
        secondView.addSubview(phoneField)
        secondView.addSubview(nextButton)
        secondView.addSubview(cameraImage2)
        secondView.addSubview(cameraButton2)
         
        nameLabel2.text = "الاسم"
        nameField2.placeholder = "الاسم"
        nameField2.textAlignment = .right
        nameField2.backgroundColor = .lightText
        nameField2.delegate = self
        addresLabel2.text = "العنوان"
        addresField2.placeholder = "العنوان"
        addresField2.delegate = self
        addresField2.textAlignment = .right
        addresField2.backgroundColor = .lightText
        phoneLabel.text = "رقم الجوال"
        phoneField.placeholder = "رقم الجوال"
        phoneField.delegate = self
        phoneField.textAlignment = .right
        phoneField.backgroundColor = .lightText
        nextButton.setTitle("التالي", for: .normal)
        nextButton.backgroundColor = .white
        nextButton.setTitleColor(.blue, for: .normal)
        nextButton.layer.cornerRadius = 10
        nextButton.layer.cornerRadius = nextButton.frame.height/2
        nextButton.clipsToBounds = true
        nextButton.addTarget(self, action: #selector (nextVC), for: .touchDown)
         
        cameraImage2.image = UIImage(systemName: "camera")
        cameraImage2.tintColor = .black
        cameraButton2.setTitle(" الكميرا ", for: .normal)
        cameraButton2.backgroundColor = .white
        cameraButton2.setTitleColor(.blue, for: .normal)
        cameraButton2.titleLabel?.font = .boldSystemFont(ofSize: 15)
        cameraButton2.layer.cornerRadius = 10
        cameraButton2.layer.cornerRadius = cameraButton.frame.height/2
        cameraButton2.clipsToBounds = true
        cameraButton2.addTarget(self, action: #selector (takePicture), for: .touchDown)
         
        //
         
        hideKeyboardWhenTappedAround()
      }
       
      // view
      @objc func segmentedValueChanged(_ sender:UISegmentedControl!) {
        let segmentt = sender.selectedSegmentIndex
         
        switch segmentt {
        case 0 :
          view.bringSubviewToFront(firstView)
        case 1 :
          view.bringSubviewToFront(secondView)
        default:
          break
           
        }
         
      }
       
      //
       
      // firstVC
      @objc func takePicture(){
        let cameraView = UIImagePickerController()
        cameraView.delegate = self
        cameraView.sourceType = UIImagePickerController.SourceType.camera
        self.present(cameraView, animated: true, completion: nil)
        cameraView.allowsEditing = true
      }
       
       
      func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        cameraImage.image = pickedImage
        picker.dismiss(animated: true, completion: nil)
         
      }
       
      @objc func sendOrder() {
        addCollection()
      }
       
      func addCollection(){
        //    let requstID = UUID().uuidString
        //    let dayDate = Date()
        //    db.collection("Requests").addDocument(data:
        //                        ["UsarID":Auth.auth().currentUser?.uid , "RequstType": "***" , "RequstID": requstID , "RequstDescription" : "***", "RequstDate": dayDate ])
        //                         { (error) in
        //      if error == nil {
        //        print("new doc has been creauted..")
        //      }else{
        //        print(error?.localizedDescription)
        //      }
      }
      //***RequstType : inner ,outter plant? .take it from segment for example//
      //***RequstDescription" : user must write a Description. take this vlue from textFeiel for example//
       
       
       
      func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
      }
       
      func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         
        //    if pickerView == gift {
        return giftAray.count
        //    } else if pickerView == delivaryPicker{
        //      return delivaryArray.count
        //    } else if pickerView == treeType {
        //      return treeArray.count
        //    }
        //    return 0
      }
       
      func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //    if pickerView == gift {
        return giftAray[row]
        //    } else if pickerView == delivaryPicker {
        //      return delivaryArray[row]
        //    } else if pickerView == treeType {
        //      return treeArray[row]
        //    }
        return nil
      }
      //
       
      //secondVC
       
      @objc func nextVC() {
        let nextVC = NextVc()
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
         
      }
       
      //
       
      func hideKeyboardWhenTappedAround() {
         
        let tap = UITapGestureRecognizer(target: self, action: #selector(AddNewReqVC.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
       }
        
       @objc func dismissKeyboard() {
        view.endEditing(true)
       }
        
        

       
       
    }
