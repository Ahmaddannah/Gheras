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
   // var arrOfUsers: NSArray = []
//        var arrOfUsers = []
//    var arrOfNames = ["name" , "name2"] // wrong
//    var arrOfImages = ["person" , "heart"] //wrong
    
    let db = Firestore.firestore()
    var users = [User]()
    
    override func loadView() {
        super.loadView()
        setupTableView()
        
        
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        
        loadUser()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 70
        
        tableView.register(AllUsersCell.self, forCellReuseIdentifier: "cell")
    }
    
//        func getUserData(){
//
//            db.collection("Users").order(by: "point")
//              .getDocuments{ (snapshot, error) in
//
//                if let error = error {
//
//                  print(error.localizedDescription)
//
//                }else {
//
//                  self.users.removeAll()
//
//                  for document in snapshot!.documents {
//
//                    let data = getData(name: document.get("name") as! String , description: document.get("post") as! String)
//
//                    self.users.append(data)
//
//                  }
//                  self.tableView.reloadData()
//
//                }
//              }
//          }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func loadUser()  {
            db.collection("Users").order(by: "point", descending: true).addSnapshotListener { querySnapshot, error in
                self.users = []
                if let error = error {
                    print("Error: ",error.localizedDescription)
                }else {
                    for document in querySnapshot!.documents {
                        let data = document.data()
                        let newUser = User(email: data["email"] as? String ?? "nil", name: data["name"] as? String ?? "nil", userIcon: data["userIcon"] as? String ?? "nil", point: data["point"] as? Int ?? 0)
                        self.users.append(newUser)
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    
    
    


extension AllUsersVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AllUsersCell
        
        cell.nameLabel.text = users[indexPath.row].name
//        cell.pointLabel.text = String(users[indexPath.row].point)
        cell.pointLabel.text = String(users[indexPath.row].point) + " غرسة"
        
        
        
       // cell.userIconImageView.image = users[indexPath.row].userIcon.image
        return cell
    }
    }


