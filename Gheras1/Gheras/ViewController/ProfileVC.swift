//
//  ProfileVC.swift
//  Gheras
//
//  Created by AlDanah Aldohayan on 16/12/2021.
//
import UIKit
import Firebase


class ProfileVC: UIViewController {
   
   
  let db = Firestore.firestore()
  var userId = Auth.auth().currentUser?.uid
  let imagePicker = UIImagePickerController()
  var updateImageName = "\(UUID().uuidString).png"
   
  //+++
  var requestArray = [Request]()
   
   
  //UIImageView
  let userIcon : UIImageView = {
    let imageView = UIImageView()
    imageView.tintColor = .blue
    imageView.contentMode = .scaleAspectFill
    imageView.frame.size = CGSize(width: 70, height: 70)
    imageView.layer.cornerRadius = imageView.frame.width/2
    imageView.clipsToBounds = true
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
   
  //UIButton-signOutBtn
    let signOutBtn : UIButton = {
      let button = UIButton()
      button.setImage(UIImage(systemName: "rectangle.portrait.and.arrow.right"), for: .normal)
      button.setTitleColor(.white, for: .normal)
        button.tintColor =  .green
      button.layer.cornerRadius = 15
      button.addTarget(self, action: #selector(signOut), for: .touchDown)
      button.translatesAutoresizingMaskIntoConstraints = false
      return button
  }()
  // UILabel-nameLable
  let nameLbl : UILabel = {
    let nameLable = UILabel()
    nameLable.textAlignment = .center
    nameLable.font = UIFont.systemFont(ofSize: 20, weight: .regular)
    nameLable.adjustsFontSizeToFitWidth = true
    nameLable.translatesAutoresizingMaskIntoConstraints = false
    return nameLable
  }()
  //UILabel-numberOfGherasLbl
  let pointLbl : UILabel = {
    let numberOfGherasLbl = UILabel()
    numberOfGherasLbl.textAlignment = .center
    numberOfGherasLbl.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    numberOfGherasLbl.adjustsFontSizeToFitWidth = true
    numberOfGherasLbl.translatesAutoresizingMaskIntoConstraints = false
    return numberOfGherasLbl
  }()
   
  //UIButton-editPhotoBtn
  let editPhotoBtn : UIButton = {
    let editPhotoBtn = UIButton()
    editPhotoBtn.setTitle("تعديل الصورة", for: .normal)
    editPhotoBtn.setTitleColor(.blue, for: .normal)
    editPhotoBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    editPhotoBtn.addTarget(self, action: #selector(editPhotoPressed), for: .touchDown)
    editPhotoBtn.translatesAutoresizingMaskIntoConstraints = false
    return editPhotoBtn
  }()
  //UIImageView-GherasImage
  let GherasImage : UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(systemName: "rosette")
    imageView.tintColor = .blue
    imageView.contentMode = .scaleAspectFit
    imageView.clipsToBounds = true
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
   
  //Tableview
  let tableView : UITableView = {
    let tableView = UITableView()
    tableView.rowHeight = 110
    tableView.backgroundColor = .gray
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()
  //UIButton-signOutBtn
    let infoBtn : UIButton = {
      let infoBtn = UIButton()
      infoBtn.setImage(UIImage(systemName: "info.circle"), for: .normal)
      infoBtn.tintColor = .white
        infoBtn.backgroundColor = .green
      infoBtn.frame.size = CGSize(width: 40, height: 40)
      infoBtn.layer.cornerRadius = infoBtn.frame.width/2
      infoBtn.addTarget(self, action: #selector(questionsView), for: .touchDown)
      infoBtn.translatesAutoresizingMaskIntoConstraints = false
      return infoBtn
  }()
   
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    imagePicker.delegate = self
    view.backgroundColor = .white
    //+++
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(RequestCell.self, forCellReuseIdentifier: "reqCell")
    loudData()
     
  }
   
  override func viewWillAppear(_ animated: Bool) {
    DispatchQueue.main.async {
      self.loadUser()
    }
     
     
  }
   
  @objc func questionsView() {
    let vc = questionsViewController()
    vc.modalPresentationStyle = .fullScreen
    self.present(vc, animated: true, completion: nil)
  }
   
  @objc func editPhotoPressed() {
    imagePicker.sourceType = .photoLibrary
    present(imagePicker, animated: true, completion: nil)
  }
   
  @objc func signOut() {
    let alert = UIAlertController(title: "", message: "هل انت متأكد من تسجيل الخروج؟", preferredStyle: .alert)
    let signOutBtn = UIAlertAction(title: "تسجيل خروج", style: .destructive) { alertAction in
      do {
        try Auth.auth().signOut()
        let vc = SignInVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
      }catch {
        print("Error: ",error.localizedDescription)
      }
    }
    alert.addAction(signOutBtn)
    alert.addAction(UIAlertAction(title: "إلغاء", style: .cancel, handler: nil))
    present(alert, animated: true, completion: nil)
  }
   
   
   
  //MARK: fetch user data
  func loadUser() {
    if let userId = userId {
      db.collection("Users").document(userId).getDocument { documentSnapshot, error in
        if let error = error {
          print("Error: ",error.localizedDescription)
        }else {
          self.nameLbl.text = documentSnapshot?.get("name") as? String ?? "nil"
          self.pointLbl.text = String(documentSnapshot?.get("point") as? Int ?? 0) + " غرسه"
          let imgStr = documentSnapshot?.get("userIcon") as? String
          if imgStr == "nil" {
            self.userIcon.image = UIImage(systemName: "person.circle")
          }
          else {
//            sleep(2)
              self.loadImage(imgStr: imgStr!)
             
          }
           
           
        }
      }
    }
  }
   
  func loadImage(imgStr: String) {
    let url = "gs://gheras-196bd.appspot.com/images/" + "\(imgStr)"
 
    let Ref = Storage.storage().reference(forURL: url)
    Ref.getData(maxSize: 1 * 1024 * 1024) { data, error in
      if error != nil {
        print("Error: Image could not download!")
        print("===================")
        print(error?.localizedDescription)
      } else {
        self.userIcon.image = UIImage(data: data!)
      }
    }
  }
   
  //MARK: update user icon
  func updateUserIcon() {
    uploadImage()
    self.db.collection("Users")
      .document(userId!).updateData(
        [
          "userIcon": userIcon.image == UIImage(systemName: "person.circle") ? "nil" : updateImageName
        ])
    {(error) in
      if error == nil {
        print("Added image Succ..")
      }else {
        print(error!.localizedDescription)
      }
    }
     
  }
   
  func uploadImage(){
    let imagefolder = Storage.storage().reference().child("images")
    if let imageData = userIcon.image?.jpegData(compressionQuality: 0.1) {
      imagefolder.child(updateImageName).putData(imageData, metadata: nil){
        (metaData , error) in
        if let error = error {
          print(error.localizedDescription)
        }else {
          print("update image Succ..")
        }
      }
    }
  }
   
   
  //+++++
  //تغريد
//  func loudData(){
//    db.collection("Requests").getDocuments { [self] (qurySnapshot, error) in
//      if let error = error {
//        print(error)
//      }else{
//        for doc in qurySnapshot!.documents {
//          let data = doc.data()
//          let timestamp: Timestamp = data["RequstDate"] as! Timestamp
//          let datetest: Date = timestamp.dateValue()
//          print(datetest)
//          self.requestArray.append(Request(RequstType: "نوع الطلب: \(data["RequstType"]as? String ?? "no RequstType")", RequstID: "رقم الطلب: \(data["RequstID"]as? String ?? "no RequstID")", RequstDescription: "وصف الطلب/العنوان: \(data["RequstDescription"]as? String ?? "no RequstDescription")", RequstDate: datetest ))
//          print (self.requestArray.count)
//          self.tableView.reloadData()
//        }
//      }
//    }
//  }
    
    func loudData(){
           db.collection("Requests").getDocuments { [self] (qurySnapshot, error) in
               if let error = error {
                   print(error)
               }else{
                   for doc in qurySnapshot!.documents {
                       let data = doc.data()
                       let timestamp: Timestamp = data["RequstDate"] as! Timestamp
                       let datetest: Date = timestamp.dateValue()
                       if (doc.get("UsarID")as? String ?? "nil") == Auth.auth().currentUser?.uid {
                           self.requestArray.append(Request(RequstType: "نوع الطلب: \(data["RequstType"]as? String ?? "no RequstType")", RequstID: "رقم الطلب: \(data["RequstID"]as? String ?? "no RequstID")", RequstDescription: "وصف الطلب/العنوان: \(data["RequstDescription"]as? String ?? "no RequstDescription")", RequstDate: datetest ))}
                       self.tableView.reloadData()
                   }
               }
           }
       }
    
    
//    @objc func OpenCamera() {
//          let cameraView = UIImagePickerController()
//          cameraView.delegate = self
//          cameraView.sourceType = .camera
//          self.present(cameraView, animated: true, completion: nil)
//
//          print("Camera Opend..")
//        }
//
//
//        @objc func AccessPhoto() {
//          let picker = UIImagePickerController()
//          picker.allowsEditing = true
//          picker.delegate = self
//          present(picker, animated: true)
//        }
//
//      func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//    //    guard let image = info[.editedImage] as? UIImage else { return }
//
//        let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
//
//
//        self.image.image = pickedImage
//        picker.dismiss(animated: true, completion: nil)
//      }
 
}


//MARK: -UIImagePickerController
extension ProfileVC: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
    userIcon.image = pickedImage
    updateUserIcon()
    picker.dismiss(animated: true, completion: nil)
  }
}



//MARK: -NSLayoutConstraint
extension ProfileVC {
  private func setupView() {
    view.addSubview(userIcon)
    view.addSubview(signOutBtn)
    view.addSubview(nameLbl)
    view.addSubview(GherasImage)
    view.addSubview(pointLbl)
    view.addSubview(editPhotoBtn)
    view.addSubview(tableView)
    tableView.setEmptyMessage("لا يوجد طلبات، اتجه للخريطة وحدد موقع الغرس لتنفيذ طلب جديد!")
    view.addSubview(infoBtn)
     
    NSLayoutConstraint.activate([
      signOutBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
      signOutBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      signOutBtn.heightAnchor.constraint(equalToConstant: 40),
      signOutBtn.widthAnchor.constraint(equalToConstant: 40),
       
      userIcon.topAnchor.constraint(equalTo: signOutBtn.bottomAnchor, constant: 20),
      userIcon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      userIcon.heightAnchor.constraint(equalToConstant: 70),
      userIcon.widthAnchor.constraint(equalToConstant: 70),
       
      nameLbl.topAnchor.constraint(equalTo: userIcon.topAnchor,constant: 0),
      nameLbl.trailingAnchor.constraint(equalTo: userIcon.leadingAnchor, constant: -10),
      nameLbl.heightAnchor.constraint(equalToConstant: 35),
       
      GherasImage.topAnchor.constraint(equalTo: nameLbl.bottomAnchor,constant: 8),
      GherasImage.trailingAnchor.constraint(equalTo: nameLbl.trailingAnchor),
      GherasImage.heightAnchor.constraint(equalToConstant: 25),
      GherasImage.widthAnchor.constraint(equalToConstant: 25),
       
       
      pointLbl.trailingAnchor.constraint(equalTo: GherasImage.leadingAnchor,constant: -5),
      pointLbl.heightAnchor.constraint(equalToConstant: 25),
      pointLbl.centerYAnchor.constraint(equalTo: GherasImage.centerYAnchor),
       
      editPhotoBtn.topAnchor.constraint(equalTo: userIcon.bottomAnchor,constant: 5),
      editPhotoBtn.heightAnchor.constraint(equalToConstant: 25),
      editPhotoBtn.centerXAnchor.constraint(equalTo: userIcon.centerXAnchor),
       
       
      //++++
      tableView.topAnchor.constraint(equalTo: pointLbl.bottomAnchor, constant: 100 ),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 20 ),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -20 ),
      tableView.heightAnchor.constraint(equalToConstant: 350),
       
      infoBtn.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20),
      infoBtn.leadingAnchor.constraint(equalTo: tableView.leadingAnchor , constant: 0),
      infoBtn.heightAnchor.constraint(equalToConstant: 40),
      infoBtn.widthAnchor.constraint(equalToConstant: 40),
       
    ])
  }
}


extension ProfileVC : UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return requestArray.count
  }
   
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "reqCell", for: indexPath) as! RequestCell
    cell.RequstID.text = requestArray[indexPath.row].RequstID
    cell.RequstType.text = requestArray[indexPath.row].RequstType
    cell.RequstDescription.text = requestArray[indexPath.row].RequstDescription
    // dateformatter
    let date = requestArray[indexPath.row].RequstDate
    var stringDate = ""
    let formatter = DateFormatter()
    formatter.dateFormat = "MMM d, yyyy"
    stringDate = "تاريخ الطلب: " + formatter.string(from: date ?? Date())
    //
     
    cell.RequstDate.text = stringDate
    return cell
  }
   
}







extension UITableView {

    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 15)
        messageLabel.sizeToFit()

        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }

    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}
