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
//    public var  requstType = ""

    
    let cameraView = UIImagePickerController()

    // viewController
    let firstView = UIView(frame: CGRect(x: 0, y: 120, width: 400, height: 700))
    let secondView = UIView(frame: CGRect(x: 0, y: 120, width: 400, height: 700))
    let nextSecondView = UIView(frame: CGRect(x: 0, y: 120, width: 400, height: 700))
    let cameraVC = UIView(frame: CGRect(x: 0, y: 120, width: 400, height: 700))
    let mySegment = UISegmentedControl (items: ["موقع عام","موقع خاص"])
    
    //
    
    // firstVC
    let nameLabel = UILabel(frame: CGRect(x: 300, y: 70, width: 100, height: 40))
    let nameField = UITextField(frame: CGRect(x: 40, y: 110, width: 300, height: 40))
    let addressLabel = UILabel(frame: CGRect(x: 290, y: 180, width: 100, height: 40))
    var addressField = UITextField(frame: CGRect(x: 40, y: 220, width: 300, height: 40))
//    var addressLabelLocation = UILabel(frame: CGRect(x: 40, y: 220, width: 300, height: 40))
    let giftLabel = UILabel(frame: CGRect(x: 200, y: 300, width: 100, height: 30))
    let giftButton = UIButton(frame: CGRect(x: 270, y: 300, width: 100, height: 30))
    let nextButton = UIButton(frame: CGRect(x: 100, y: 600, width: 200, height: 60))
    //
    
    // secondVC
    let nameLabel2 = UILabel(frame: CGRect(x: 300, y: 70, width: 100, height: 40))
    let nameField2 = UITextField(frame: CGRect(x: 40, y: 110, width: 300, height: 40))
    let addressLabel2 = UILabel(frame: CGRect(x: 290, y: 180, width: 100, height: 40))
    let addressField2 = UITextField(frame: CGRect(x: 40, y: 220, width: 300, height: 40))
    let phoneLabel = UILabel(frame: CGRect(x: 260, y: 290, width: 100, height: 40))
    let phoneField = UITextField(frame: CGRect(x: 40, y: 330, width: 300, height: 40))
    let nextButton2 = UIButton(frame: CGRect(x: 100, y: 600, width: 200, height: 60))
    //
    
    // next secondVC
    let timeLabel = UILabel(frame: CGRect(x: 0, y: 230, width: 400, height: 30))
    let timPicker = UIDatePicker(frame: CGRect(x: 30, y: 300, width: 40, height: 60))
    let deliveryLabel = UILabel(frame: CGRect(x: 0, y: 380, width: 400, height: 30))
    let deliveryPicker = UIPickerView(frame:CGRect(x: 120, y: 420, width: 150, height: 100))
    let deliveryArray = [
        "نعم",
        "لا"
    ]
    let treeLabel = UILabel(frame: CGRect(x: 0, y: 50, width: 400, height: 30))
    let treeType = UIPickerView(frame: CGRect(x: 50, y: 100, width: 300, height: 100))
    let treeArray = [
        "اللوز الهندي",
        "السدر",
        "الزنزلخت النيم",
        "طلح ملحي",
        "فكس لسان العصفور",
        "ثيبوبيا"
    ]
    let nextButton3 = UIButton(frame: CGRect(x: 210, y: 600, width: 150, height: 60))
    let backButton = UIButton(frame: CGRect(x: 40, y: 600, width: 150, height: 60))
    //
    
    // cameraVC
    let cameraImage = UIImageView(frame: CGRect(x: 50, y: 40, width: 300, height: 400))
    let cameraButton = UIButton(frame: CGRect(x: 100, y: 450, width: 200, height: 60))
    let sendButton = UIButton(frame: CGRect(x: 100, y: 600, width: 200, height: 60))
    
     
    
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
        
        cameraView.delegate = self
        


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
        view.backgroundColor = .systemGray2
        
        view.addSubview(cameraVC)
        view.addSubview(nextSecondView)
        view.addSubview(secondView)
        view.addSubview(firstView)
        view.addSubview(mySegment)
        
        mySegment.frame = CGRect(x: 40, y: 70, width: 300, height: 50)
        mySegment.addTarget(self, action: #selector(segmentValueChanged(_:)), for: .valueChanged)
        mySegment.selectedSegmentIndex = 0
    }
    
    // view functions
    @objc func segmentValueChanged(_ sender:UISegmentedControl!) {
        let segment = sender.selectedSegmentIndex
        switch segment {
        case 0 :
            view.bringSubviewToFront(firstView)
            var requstType = "موقع عام"
        case 1 :
            view.bringSubviewToFront(secondView)
            var requstType = "موقع خاص"

        default:
            break
        }
    }
    
   
    
}


extension AddNewReqVC {
    // firstVC
    
    func detailsOfFirstVC() {
        firstView.backgroundColor = .systemGray2
        
        firstView.addSubview(nameLabel)
        firstView.addSubview(nameField)
        firstView.addSubview(addressLabel)
        firstView.addSubview(addressField)
        firstView.addSubview(giftLabel)
        firstView.addSubview(giftButton)
        firstView.addSubview(nextButton)
        
        nameLabel.text = "الاسم"
        nameField.placeholder = "الاسم"
        nameField.textAlignment = .right
        nameField.backgroundColor = .lightText
        nameField.delegate = self
        addressLabel.text = "العنوان"
        addressField.placeholder = "العنوان"
        let vc = MapsVC()
//        addressField.placeholder = vc.coordinatesAddressLabel.text
        addressField.delegate = self
        addressField.textAlignment = .right
        addressField.backgroundColor = .lightText
        giftLabel.text = "ارسال هدية"
        giftButton.setImage(UIImage(systemName: "circle"), for: .normal)
        giftButton.tintColor = .gray
        giftButton.addTarget(self, action: #selector(buttonChecked), for: .touchDown)
        nextButton.setTitle("التالي", for: .normal)
        nextButton.backgroundColor = .white
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.layer.cornerRadius = 10
        nextButton.layer.cornerRadius = nextButton.frame.height/2
        nextButton.clipsToBounds = true
        nextButton.addTarget(self, action: #selector (goToCamera), for: .touchDown)
    }
   
    @objc func buttonChecked() {
        print("image changed")
        if giftButton.currentImage == UIImage(systemName: "circle") {
            giftButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            giftButton.tintColor = .green
        } else {
            giftButton.setImage(UIImage(systemName: "circle"), for: .normal)
            giftButton.tintColor = .gray
        }
    }
    
    
    @objc func goToCamera() {
        print("public go to camera")
        view.bringSubviewToFront(cameraVC)
    }
    
    
    
}


extension AddNewReqVC {
    // secondVC
    
    func detailsOfSecondVC() {
        secondView.backgroundColor = .systemGray2
        
        secondView.addSubview(nameLabel2)
        secondView.addSubview(nameField2)
        secondView.addSubview(addressLabel2)
        secondView.addSubview(addressField2)
        secondView.addSubview(phoneLabel)
        secondView.addSubview(phoneField)
        secondView.addSubview(nextButton2)
        
        nameLabel2.text = "الاسم"
        nameField2.placeholder = "الاسم"
        nameField2.textAlignment = .right
        nameField2.backgroundColor = .lightText
        nameField2.delegate = self
        addressLabel2.text = "العنوان"
        addressField2.placeholder = "العنوان"
        addressField2.delegate = self
        addressField2.textAlignment = .right
        addressField2.backgroundColor = .lightText
        phoneLabel.text = "رقم الجوال"
        phoneField.placeholder = "رقم الجوال"
        phoneField.delegate = self
        phoneField.textAlignment = .right
        phoneField.backgroundColor = .lightText
        nextButton2.setTitle("التالي", for: .normal)
        nextButton2.backgroundColor = .white
        nextButton2.setTitleColor(.black, for: .normal)
        nextButton2.layer.cornerRadius = 10
        nextButton2.layer.cornerRadius = nextButton2.frame.height/2
        nextButton2.clipsToBounds = true
        nextButton2.addTarget(self, action: #selector (completeForm), for: .touchDown)
        
    }
    
    @objc func completeForm() {
        print("private form completion")
        view.bringSubviewToFront(nextSecondView)
    }
    
    
}


extension AddNewReqVC {
    // nextSecondVC
    
    func detailsOfNextSecondVC() {
        nextSecondView.backgroundColor = .systemGray2
        
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
        deliveryLabel.backgroundColor = .gray
        deliveryLabel.textAlignment = .center
        deliveryPicker.delegate = self
        deliveryPicker.dataSource = self
        timeLabel.text = " اليوم"
        timeLabel.backgroundColor = .gray
        timeLabel.textAlignment = .center
        treeLabel.text = " نوع الشجر"
        treeLabel.backgroundColor = .gray
        treeLabel.textAlignment = .center
        treeType.delegate = self
        treeType.dataSource = self
        nextButton3.setTitle("التالي ", for: .normal)
        nextButton3.backgroundColor = .white
        nextButton3.setTitleColor(.black, for: .normal)
        nextButton3.layer.cornerRadius = 10
        nextButton3.layer.cornerRadius = nextButton3.frame.height/2
        nextButton3.clipsToBounds = true
        nextButton3.addTarget(self, action: #selector (goToCompletForm), for: .touchDown)
        backButton.setTitle("رجوع ", for: .normal)
        backButton.backgroundColor = .white
        backButton.setTitleColor(.black, for: .normal)
        backButton.layer.cornerRadius = 10
        backButton.layer.cornerRadius = backButton.frame.height/2
        backButton.clipsToBounds = true
        backButton.addTarget(self, action: #selector (backToPrivateForm), for: .touchDown)
        
    }
    
    
    @objc func goToCompletForm() {
        print("private go to camera")
        view.bringSubviewToFront(cameraVC)
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
        cameraVC.backgroundColor = .systemGray2
        
        cameraVC.addSubview(cameraImage)
        cameraVC.addSubview(cameraButton)
        cameraVC.addSubview(sendButton)
        
//        cameraImage.image = UIImage(systemName: "camera")
        cameraButton.setTitle(" اضافة صورة", for: .normal)
        cameraButton.backgroundColor = .white
        cameraButton.setTitleColor(.black, for: .normal)
        cameraButton.layer.cornerRadius = 10
        cameraButton.layer.cornerRadius = cameraButton.frame.height/2
        cameraButton.clipsToBounds = true
        cameraButton.addTarget(self, action: #selector (takePicture), for: .touchDown)
        sendButton.setTitle("ارسل الطلب  ", for: .normal)
        sendButton.backgroundColor = .white
        sendButton.setTitleColor(.black, for: .normal)
        sendButton.layer.cornerRadius = 10
        sendButton.layer.cornerRadius = sendButton.frame.height/2
        sendButton.clipsToBounds = true
        sendButton.addTarget(self, action: #selector (sendOrder), for: .touchDown)
    }

    @objc func sendOrder() {
       print("send order")
        addCollection()
        
    }
    
    func addCollection(){
        
          let requstID = UUID().uuidString
          let dayDate = Date()
          db.collection("Requests").addDocument(data: [
            "UsarID": Auth.auth().currentUser?.uid ,
            "RequstType":  "%%%",
            "RequstID": requstID ,
            "RequstLocation" : addressField,
            "RequstDate": dayDate
          ])
          { (error) in
            if error == nil {
              print("new doc has been creauted..")
            }else{
              print(error?.localizedDescription)
            }
          }
          //***RequstType : inner ,outter plant? .take it from segment for example//
          //***RequstDescription” : user must write a Description. take this vlue from textFeiel for example//
        }
    
    
    @objc func takePicture() {
        print("camera")
        cameraView.sourceType = .camera
        cameraView.allowsEditing = true
        present(cameraView, animated: true, completion: nil)
    }
    
    // camera function
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        cameraImage.image = pickedImage
        picker.dismiss(animated: true, completion: nil)
    }
    
    
}
