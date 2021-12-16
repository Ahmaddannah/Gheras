//
//  ViewController9.swift
//  Gheras
//
//  Created by Ahmad MacBook on 15/12/2021.
//

import UIKit

class NextVc: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource {
       
      let timeLabel = UILabel(frame: CGRect(x: 0, y: 330, width: 400, height: 30))
      let timPicker = UIDatePicker(frame: CGRect(x: 40, y: 380, width: 60, height: 60))
      let delivaryLabel = UILabel(frame: CGRect(x: 0, y: 450, width: 400, height: 30))
      let delivaryPicker = UIPickerView(frame:CGRect(x: 130, y: 480, width: 150, height: 100))
      let delivaryArray = [
        "نعم",
        "لا"
      ]
      let treeLabel = UILabel(frame: CGRect(x: 0, y: 150, width: 400, height: 30))
      let treeType = UIPickerView(frame: CGRect(x: 40, y: 200, width: 300, height: 100))
      let treeArray = [
        "اللوز الهندي",
        "السدر",
        "الزنزلخت النيم",
        "طلح ملحي",
        "فكس لسان العصفور",
        "ثيبوبيا"
      ]
       
      let sendButton = UIButton(frame: CGRect(x: 200, y: 700, width: 150, height: 60))
      let backButton = UIButton(frame: CGRect(x: 20, y: 700, width: 150, height: 60))

      override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
         
            view.addSubview(timeLabel)
            view.addSubview(timPicker)
            view.addSubview(delivaryLabel)
            view.addSubview(delivaryPicker)
        view.addSubview(sendButton)
        view.addSubview(backButton)
         
        timPicker.preferredDatePickerStyle = .compact
        timPicker.datePickerMode = .date
        delivaryLabel.text = "توصيل سريع"
        delivaryLabel.backgroundColor = .gray
        delivaryLabel.textAlignment = .center
        delivaryPicker.delegate = self
        delivaryPicker.dataSource = self
        timeLabel.text = "اختر اليوم"
        timeLabel.backgroundColor = .gray
        timeLabel.textAlignment = .center
         
        view.addSubview(treeLabel)
        view.addSubview(treeType)
        treeLabel.text = "اختر نوع الشجر"
        treeLabel.backgroundColor = .gray
        treeLabel.textAlignment = .center
        treeType.delegate = self
        treeType.dataSource = self
         
        sendButton.setTitle("ارسل الطلب ", for: .normal)
        sendButton.backgroundColor = .white
        sendButton.setTitleColor(.blue, for: .normal)
        sendButton.layer.cornerRadius = 10
        sendButton.layer.cornerRadius = sendButton.frame.height/2
        sendButton.clipsToBounds = true
        sendButton.addTarget(self, action: #selector (sendOrder), for: .touchDown)

        backButton.setTitle("الرجوع ", for: .normal)
        backButton.backgroundColor = .white
        backButton.setTitleColor(.blue, for: .normal)
        backButton.layer.cornerRadius = 10
        backButton.layer.cornerRadius = sendButton.frame.height/2
        backButton.clipsToBounds = true
        backButton.addTarget(self, action: #selector (goBack), for: .touchDown)


      }
       
      func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
      }
       
      func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         
      if pickerView == delivaryPicker{
          return delivaryArray.count
        } else if pickerView == treeType {
          return treeArray.count
        }
        return 0
      }
       
      func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         
        if pickerView == delivaryPicker {
          return delivaryArray[row]
        } else if pickerView == treeType {
          return treeArray[row]
        }
        return nil
      }
       
       
      @objc func sendOrder() {
        print("!d")
      }
      @objc func goBack() {
        let nextVC = AddNewReqVC()
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
         
      }

    }
