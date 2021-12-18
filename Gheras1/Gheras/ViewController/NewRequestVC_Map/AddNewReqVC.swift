//
//  ViewController8.swift
//  Gheras
//
//  Created by Ahmad MacBook on 15/12/2021.
//

import UIKit
import Firebase


class AddNewReqVC: UIViewController , UITextFieldDelegate {
    
    let db = Firestore.firestore()
    var gift = false
var userID = Auth.auth().currentUser?.uid
    
    let cameraView = UIImagePickerController()

   
    
    // viewController
    let firstView = UIView()
    let secondView = UIView()
    let nextSecondView = UIView()
    let publicCameraVC = UIView()
    let privateCameraVC = UIView()
    let formSegment = UISegmentedControl (items: ["موقع عام","موقع خاص"])
    
    // firstVC
    let nameField = UITextField()
    let addressField = UITextField()
    let giftLabel = UILabel()
    let giftButton = UIButton()
    let nextButton = UIButton()
    let backToMap = UIButton()
    
    // secondVC
    let nameField2 = UITextField()
    let addressField2 = UITextField()
    let phoneField = UITextField()
    let nextButton2 = UIButton()
    let backToMap2 = UIButton()
  
    // next secondVC
    let timeLabel = UILabel()
    let timPicker = UIDatePicker()
    let deliveryLabel = UILabel()
    let deliveryPicker = UIPickerView()
    let deliveryArray = [
        "نعم",
        "لا"
    ]
    let treeLabel = UILabel()
    let treeType = UIPickerView()
    let treeArray = [
        "السدر",
        "الزنزلخت النيم",
        "طلح ملحي",
        "فكس لسان العصفور",
        "ثيبوبيا"
    ]
    let nextButton3 = UIButton()
    let backButton = UIButton()
    
    // publicCameraVC
    let cameraImage = UIImageView()
    let cameraButton = UIButton()
    let sendButton = UIButton()
    
    // privateCameraVC
    let cameraImage2 = UIImageView()
    let cameraButton2 = UIButton()
    let sendButton2 = UIButton()
    
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     

        // view
        detailsOfVC()
        //
        
        
        // firstVc
        detailsOfFirstVC()
        //
        
        // secondVc
        detailsOfSecondVC()
        //
        
        // NextSecondVC
        detailsOfNextSecondVC()
        
        //
        
        // cameraVC
        detailsOfCameraVC()
        //
        
        hideKeyboardWhenTappedAround()
        
        setDesign()
        
        cameraView.delegate = self
        
        overrideUserInterfaceStyle = .light
        

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


extension AddNewReqVC {
    // view
    func detailsOfVC() {
        view.backgroundColor = .white
        
        view.addSubview(privateCameraVC)
        view.addSubview(publicCameraVC)
        view.addSubview(nextSecondView)
        view.addSubview(secondView)
        view.addSubview(firstView)
        view.addSubview(formSegment)
        
        formSegment.frame = CGRect(x: 40, y: 70, width: 300, height: 50)
        formSegment.addTarget(self, action: #selector(segmentValueChanged(_:)), for: .valueChanged)
        formSegment.selectedSegmentIndex = 0
    }
    
    // view functions
    @objc func segmentValueChanged(_ sender:UISegmentedControl!) {
        let segment = sender.selectedSegmentIndex
        switch segment {
        case 0 :
            view.bringSubviewToFront(firstView)
        case 1 :
            view.bringSubviewToFront(secondView)
        default:
            break
        }
        
    }
    
   
    
}


extension AddNewReqVC {
    // firstVC
    
    func detailsOfFirstVC() {
        firstView.backgroundColor = .white
        
        firstView.addSubview(nameField)
        firstView.addSubview(addressField)
        firstView.addSubview(giftLabel)
        firstView.addSubview(giftButton)
        firstView.addSubview(nextButton)
        firstView.addSubview(backToMap)
        
        nameField.placeholder = "الاسم"
        nameField.textAlignment = .right
        nameField.backgroundColor = .lightText
        nameField.delegate = self
        addressField.placeholder = "العنوان"
        addressField.delegate = self
        addressField.textAlignment = .right
        addressField.backgroundColor = .lightText
        giftLabel.text = "ارسال هدية"
        giftButton.setImage(UIImage(systemName: "circle"), for: .normal)
        giftButton.tintColor = .gray
        giftButton.addTarget(self, action: #selector(buttonChecked), for: .touchDown)
        nextButton.setTitle("التالي", for: .normal)
        nextButton.backgroundColor = .myColor
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.layer.cornerRadius = 10
        nextButton.clipsToBounds = true
        nextButton.addTarget(self, action: #selector (goToCamera), for: .touchDown)
        backToMap.setTitle("الغاء", for: .normal)
        backToMap.backgroundColor = .myColor
        backToMap.setTitleColor(.white, for: .normal)
        backToMap.layer.cornerRadius = 10
        backToMap.clipsToBounds = true
        backToMap.addTarget(self, action: #selector (backToMapVC), for: .touchDown)
    }
    
    
    @objc func buttonChecked() {
        
        print("image changed")
        if giftButton.currentImage == UIImage(systemName: "circle") {
            giftButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            giftButton.tintColor = .myColor
            gift = true
            
        } else {
            giftButton.setImage(UIImage(systemName: "circle"), for: .normal)
            giftButton.tintColor = .gray
            gift = false
        }
    }
    
    
    @objc func goToCamera() {
        print("public go to camera")
        view.bringSubviewToFront(publicCameraVC)
    }
    
    @objc func backToMapVC() {
        print("back to map")
                let vc = TabBarVC()
        vc.modalPresentationStyle = .fullScreen

                present(vc, animated: true, completion: nil)
    }
    
    
    
}


extension AddNewReqVC {
    // secondVC
    
    func detailsOfSecondVC() {
        secondView.backgroundColor = .white
        
        secondView.addSubview(nameField2)
        secondView.addSubview(addressField2)
        secondView.addSubview(phoneField)
        secondView.addSubview(nextButton2)
        secondView.addSubview(backToMap2)
        
        nameField2.placeholder = "الاسم"
        nameField2.textAlignment = .right
        nameField2.backgroundColor = .lightText
        nameField2.delegate = self
        addressField2.placeholder = "العنوان"
        addressField2.delegate = self
        addressField2.textAlignment = .right
        addressField2.backgroundColor = .lightText
        phoneField.placeholder = "رقم الجوال"
        phoneField.delegate = self
        phoneField.textAlignment = .right
        phoneField.backgroundColor = .lightText
        nextButton2.setTitle("التالي", for: .normal)
        nextButton2.backgroundColor = .myColor
        nextButton2.setTitleColor(.white, for: .normal)
        nextButton2.layer.cornerRadius = 10
        nextButton2.clipsToBounds = true
        nextButton2.addTarget(self, action: #selector (completeForm), for: .touchDown)
        backToMap2.setTitle("الغاء", for: .normal)
        backToMap2.backgroundColor = .myColor
        backToMap2.setTitleColor(.white, for: .normal)
        backToMap2.layer.cornerRadius = 10
        backToMap2.clipsToBounds = true
        backToMap2.addTarget(self, action: #selector (backToMapVC2), for: .touchDown)
        
    }
    
    @objc func completeForm() {
        print("private form completion")
        view.bringSubviewToFront(nextSecondView)
    }
    
    @objc func backToMapVC2() {
        print("back to map")
                let vc = TabBarVC()
        vc.modalPresentationStyle = .fullScreen

                present(vc, animated: true, completion: nil)
    }
    
    
}




extension AddNewReqVC {
    // nextSecondVC
    
    func detailsOfNextSecondVC() {
        nextSecondView.backgroundColor = .white
        
        nextSecondView.addSubview(timeLabel)
        nextSecondView.addSubview(timPicker)
        nextSecondView.addSubview(deliveryLabel)
        nextSecondView.addSubview(deliveryPicker)
        nextSecondView.addSubview(nextButton3)
        nextSecondView.addSubview(backButton)
        nextSecondView.addSubview(treeLabel)
        nextSecondView.addSubview(treeType)
        
        timPicker.preferredDatePickerStyle = .compact
        timPicker.datePickerMode = .date
        deliveryLabel.text = "توصيل سريع"
        deliveryLabel.backgroundColor = .white
        deliveryLabel.textColor = .myColor
        deliveryLabel.textAlignment = .right
        deliveryPicker.delegate = self
        deliveryPicker.dataSource = self
        timeLabel.text = " اليوم"
        timeLabel.backgroundColor = .white
        timeLabel.textColor = .myColor
        timeLabel.textAlignment = .right
        treeLabel.text = " نوع الشجر"
        treeLabel.backgroundColor = .white
        treeLabel.textColor = .myColor
        treeLabel.textAlignment = .right
        treeType.delegate = self
        treeType.dataSource = self
        nextButton3.setTitle("التالي ", for: .normal)
        nextButton3.backgroundColor = .myColor
        nextButton3.setTitleColor(.white, for: .normal)
        nextButton3.layer.cornerRadius = 10
        nextButton3.clipsToBounds = true
        nextButton3.addTarget(self, action: #selector (goToCompletForm), for: .touchDown)
        backButton.setTitle("رجوع ", for: .normal)
        backButton.backgroundColor = .myColor
        backButton.setTitleColor(.white, for: .normal)
        backButton.layer.cornerRadius = 10
        backButton.clipsToBounds = true
        backButton.addTarget(self, action: #selector (backToPrivateForm), for: .touchDown)
        
    }
    
    
    @objc func goToCompletForm() {
        print("private go to camera")
        view.bringSubviewToFront(privateCameraVC)
    }
    
    @objc func backToPrivateForm() {
        print("back to private form")
        view.bringSubviewToFront(secondView)
    }
    
    
    
}


extension AddNewReqVC: UIPickerViewDelegate, UIPickerViewDataSource {
    // pickers function
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == deliveryPicker{
            return deliveryArray.count
        } else if pickerView == treeType {
            return treeArray.count
        }
        return 0
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == deliveryPicker {
            return deliveryArray[row]
        } else if pickerView == treeType {
            return treeArray[row]
        }
        return nil
    }
    
    
}


extension AddNewReqVC:  UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    // cameraVC
    
    func detailsOfCameraVC() {
        publicCameraVC.backgroundColor = .white
        privateCameraVC.backgroundColor = .white
        
        publicCameraVC.addSubview(cameraImage)
        publicCameraVC.addSubview(cameraButton)
        publicCameraVC.addSubview(sendButton)
        
        privateCameraVC.addSubview(cameraButton2)
        privateCameraVC.addSubview(cameraImage2)
        privateCameraVC.addSubview(sendButton2)
        
        cameraButton.setTitle(" اضافة صورة", for: .normal)
        cameraButton.backgroundColor = .myColor
        cameraButton.setTitleColor( .white, for: .normal)
        cameraButton.layer.cornerRadius = 10
        cameraButton.clipsToBounds = true
        cameraButton.addTarget(self, action: #selector (takePicture), for: .touchDown)
        sendButton.setTitle("ارسل الطلب  ", for: .normal)
        sendButton.backgroundColor = .myColor
        sendButton.setTitleColor(.white, for: .normal)
        sendButton.layer.cornerRadius = 10
        sendButton.clipsToBounds = true
        sendButton.addTarget(self, action: #selector (sendPublicOrder), for: .touchDown)
        
        cameraButton2.setTitle(" اضافة صورة", for: .normal)
        cameraButton2.backgroundColor = .myColor
        cameraButton2.setTitleColor(.white, for: .normal)
        cameraButton2.layer.cornerRadius = 10
        cameraButton2.clipsToBounds = true
        cameraButton2.addTarget(self, action: #selector (takePicture), for: .touchDown)
        sendButton2.setTitle("ارسل الطلب  ", for: .normal)
        sendButton2.backgroundColor = .myColor
        sendButton2.setTitleColor(.white, for: .normal)
        sendButton2.layer.cornerRadius = 10
        sendButton2.clipsToBounds = true
        sendButton2.addTarget(self, action: #selector (sendPrivateOrder), for: .touchDown)
    }

   
    @objc func sendPublicOrder() {
        print("send Public order")
        addPublicOrderCollection()
        updateUserPoint()
                let vc = TabBarVC()
        vc.modalPresentationStyle = .fullScreen
                present(vc, animated: true, completion: nil)
    }
    
    @objc func sendPrivateOrder() {
        print("send Private order")
        addPrivateOrderCollection()
        updateUserPoint()
                let vc = TabBarVC()
        vc.modalPresentationStyle = .fullScreen

                present(vc, animated: true, completion: nil)
    }
    
    func addPublicOrderCollection(){
                let requstID = UUID().uuidString
                let dayDate = Date()
                db.collection("Requests").addDocument(data: [
                    "UsarID": Auth.auth().currentUser?.uid ,
                    "RequstType": "Public Order",
                    "RequstID": requstID ,
                    "RequstLocation" : addressField.text,
                "sendGift": gift,
                    "RequstDate": dayDate
                ])
                { (error) in
                    if error == nil {
                        print("new doc has been creauted..")
                    }else{
                        print(error?.localizedDescription)
                    }
                }
        
    }
    
    func addPrivateOrderCollection(){
                let requstID = UUID().uuidString
                let dayDate = Date()
                db.collection("Requests").addDocument(data: [
                    "UsarID": Auth.auth().currentUser?.uid ,
                    "RequstType": "Private Order",
                    "RequstID": requstID ,
                    "RequstLocation": addressField2.text,
                    "RequstDate": dayDate
                ])
                { (error) in
                    if error == nil {
                        print("new doc has been creauted..")
                    }else{
                        print(error?.localizedDescription)
                    }
                }
        
    }
    
    
    func updateUserPoint() {
        db.collection("Users").document(userID!).getDocument  { documentSnapshot, error in
            if let error = error {
                print("Error: ",error.localizedDescription)
            }else {
                var count = documentSnapshot?.get("point") as? Int
                count! += 1
                self.db.collection("Users")
                    .document(self.userID!).updateData(
                        [
                            "point": count
                        ])
                {(error) in
                    if error == nil {
                        print("update point  Succ..")
                    }else {
                        print(error!.localizedDescription)
                    }
                }
            }
        }
    }
    
    @objc func takePicture() {
        print("camera")
        let cameraView = UIImagePickerController()
        cameraView.delegate = self
        cameraView.sourceType = UIImagePickerController.SourceType.camera
        cameraView.allowsEditing = true
        self.present(cameraView, animated: true, completion: nil)
    }
    
    // camera function
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        cameraImage.image = pickedImage
        cameraImage2.image = pickedImage
        picker.dismiss(animated: true, completion: nil)
    }
    
    
}



extension AddNewReqVC {
    func setDesign() {
        
        //Constants
        let width = view.frame.width-100
        let height = view.frame.height-200
        var y = 100.0
        var y2 = 100.0
        var y3 = 100.0
        var y4 = 40.0
        var y5 = 100.0
        var y6 = 100.0
        
        
        //Segment
        formSegment.frame = CGRect(x: 50, y: y, width: width, height: height/18)
        formSegment.addTarget(self, action: #selector(segmentValueChanged(_:)), for: .valueChanged)
        formSegment.selectedSegmentIndex = 0
        y += formSegment.frame.height
        y += 40
        //Views
        firstView.frame = CGRect(x: 0, y: y, width: width, height: height-80)
        firstView.center = view.center
        secondView.frame = CGRect(x: 0, y: y, width: width, height: height-80)
        secondView.center = view.center
        nextSecondView.frame = CGRect(x: 0, y: y, width: width, height: height-80)
        nextSecondView.center = view.center
        publicCameraVC.frame = CGRect(x: 0, y: y, width: width, height: height-80)
        publicCameraVC.center = view.center
        privateCameraVC.frame = CGRect(x: 0, y: y, width: width, height: height-80)
        privateCameraVC.center = view.center
        
        // firstVC
        nameField.frame = CGRect(x: 0, y: y2, width: width, height: height/16)
        nameField.borderStyle = .roundedRect
        y2 += nameField.frame.height
        y2 += 50
        
        addressField.frame = CGRect(x: 0, y: y2, width: width, height: height/16)
        addressField.borderStyle = .roundedRect
        y2 += addressField.frame.height
        y2 += 20
        
        giftLabel.frame = CGRect(x: width/4, y: y2, width: width/2, height: height/16)
        giftLabel.textAlignment = .right
        //          giftLabel.textColor = .darkGray
        
        giftButton.frame = CGRect(x: width/1.5, y: y2, width: width/2, height: height/16)
        y2 += giftButton.frame.height
        y2 += 150
        
        nextButton.frame = CGRect(x: 0, y: y2, width: width, height: height/16)
        y2 += nextButton.frame.height
        y2 += 30
        
        backToMap.frame = CGRect(x: 0, y: y2, width: width, height: height/16)
        
        // secondVC
        nameField2.frame = CGRect(x: 0, y: y3, width: width, height: height/16)
        nameField2.borderStyle = .roundedRect
            y3 += nameField2.frame.height
            y3 += 30
        
        addressField2.frame = CGRect(x: 0, y: y3, width: width, height: height/16)
        addressField2.borderStyle = .roundedRect
            y3 += addressField2.frame.height
            y3 += 30
        
        phoneField.frame = CGRect(x: 0, y: y3, width: width, height: height/16)
        phoneField.borderStyle = .roundedRect
            y3 += phoneField.frame.height
            y3 += 150
        
        nextButton2.frame = CGRect(x: 0, y: y3, width: width, height: height/16)
        y3 += nextButton2.frame.height
           y3 += 50
        backToMap2.frame = CGRect(x: 0, y: y3, width: width, height: height/16)
        y3 += backToMap2.frame.height
           y3 += 20
        
        // next secondVC
        treeLabel.frame = CGRect(x: 0, y: y4, width: width, height: height/16)
        y4 += treeLabel.frame.height
           y4 += 20
        treeType.frame = CGRect(x: 0, y: y4, width: width, height: height/16)
        y4 += treeType.frame.height
           y4 += 25
        timeLabel.frame = CGRect(x: 0, y: y4, width: width, height: height/16)
        y4 += timeLabel.frame.height
           y4 += 20
        timPicker.frame = CGRect(x: 0, y: y4, width: width-80, height: height/16)
        y4 += timPicker.frame.height
           y4 += 30
        deliveryLabel.frame = CGRect(x: 0, y: y4, width: width, height: height/16)
        y4 += deliveryLabel.frame.height
           y4 += 20
        deliveryPicker.frame = CGRect(x: 0, y: y4, width: width, height: height/16)
        y4 += deliveryPicker.frame.height
           y4 += 45
        
        nextButton3.frame = CGRect(x: 0, y: y4, width: width, height: height/16)
        y4 += nextButton3.frame.height
           y4 += 40
        backButton.frame = CGRect(x: 0, y: y4, width: width, height: height/16)
        
        // public cameraVC
        cameraImage.frame = CGRect(x: 0, y: y5, width: width-10, height: height/16)
        y5 += cameraImage.frame.height
           y5 += 150
        cameraButton.frame = CGRect(x: 0, y: y5, width: width, height: height/16)
        y5 += cameraButton.frame.height
           y5 += 150
        sendButton.frame = CGRect(x: 0, y: y5, width: width, height: height/16)
        
        // Private CameraVC
        cameraImage2.frame = CGRect(x: 0, y: y6, width: width-10, height: height/16)
        y6 += cameraImage2.frame.height
           y6 += 150
        cameraButton2.frame = CGRect(x: 0, y: y6, width: width, height: height/16)
        y6 += cameraButton2.frame.height
           y6 += 150
        sendButton2.frame = CGRect(x: 0, y: y6, width: width, height: height/16)
        
    }
    
   
    
    
    
}


extension UIColor {
    static var myColor = #colorLiteral(red: 0, green: 0.6173447967, blue: 0.2590557933, alpha: 1)
}

