////
////  ViewController6.swift
////  Gheras
////
////  Created by Ahmad MacBook on 15/12/2021.
////
//
//import UIKit
//
//class AllUsersVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
//
//  var tableView = UITableView()
//  let myArray: NSArray = ["First","Second","Third"]
//
//  override func viewDidLoad() {
//    super.viewDidLoad()
//
//    self.view.backgroundColor = .clear
//    self.title = "الاكثر"
//
//
//    let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
//    let width: CGFloat = self.view.frame.width
//    let height: CGFloat = self.view.frame.height
//
//    tableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: width, height: height - barHeight))
//    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
//    tableView.dataSource = self
//    tableView.delegate = self
//    self.view.addSubview(tableView)
//
//
//  }
//  override func didReceiveMemoryWarning() {
//    super.didReceiveMemoryWarning()
//  }
//
//
//  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    myArray.count
//  }
//
//  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
//    cell.textLabel!.text = "\(myArray[indexPath.row])"
//    return cell
//  }
//
//  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    print("Num: \(indexPath.row)")
//    print("Value: \(myArray[indexPath.row])")
//  }
//
//}


import UIKit

class AllUsersVC: UIViewController {

  var tableView = UITableView()
  var safeArea: UILayoutGuide!
  var arrOfUsers: NSArray = []
  var arrOfNames = ["name" , "name2"] // wrong
  var arrOfImages = ["person" , "heart"] //wrong

  override func loadView() {
   super.loadView()
    setupTableView()

    view.backgroundColor = .white
    safeArea = view.layoutMarginsGuide
  }

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
