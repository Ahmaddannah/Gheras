//
//  ViewController6.swift
//  Gheras
//
//  Created by Ahmad MacBook on 15/12/2021.
//


import UIKit
import Firebase

class AllUsersVC: UIViewController {

  var tableView = UITableView()
  var safeArea: UILayoutGuide!
  var arrOfUsers: NSArray = []
//    var arrOfUsers = []
  var arrOfNames = ["name" , "name2"] // wrong
  var arrOfImages = ["person" , "heart"] //wrong
    
    let db = Firestore.firestore()

  override func loadView() {
   super.loadView()
    setupTableView()

    view.backgroundColor = .white
    safeArea = view.layoutMarginsGuide
  }

//    func getUserData(){
//
//        db.collection("Users").order(by: "point")
//          .getDocuments{ (snapshot, error) in
//
//            if let error = error {
//
//              print(error.localizedDescription)
//
//            }else {
//
//              self.arrOfNames.removeAll()
//
//              for document in snapshot!.documents {
//
//                let data = getData(name: document.get("name") as! String , description: document.get("post") as! String)
//
//                self.arrOfNames.append(data)
//
//              }
//              self.tableView.reloadData()
//
//            }
//          }
//      }
    
  func setupTableView() {
   view.addSubview(tableView)
   tableView.translatesAutoresizingMaskIntoConstraints = false
   tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
   tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
   tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
   tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
  }
    
    

}

extension AllUsersVC: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    arrOfUsers.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = arrOfNames[indexPath.row]
    cell.imageView?.image = UIImage(named: arrOfImages[indexPath.row])
    return cell
  }

}
