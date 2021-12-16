//
// RequestCell.swift
// Profile
//
// Created by TAGHREED on 12/05/1443 AH.
//

import UIKit

class RequestCell: UITableViewCell {
  var RequstType = UILabel()
  var RequstID = UILabel()
  var RequstDescription = UILabel()
  var RequstDate = UILabel()

  
   
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    addSubview(RequstType)
    addSubview(RequstID)
    addSubview(RequstDescription)
    addSubview(RequstDate)
    let cellFont = UIFont(name: RequstID.font.fontName, size: 13)
    RequstType.font = cellFont
    RequstID.font = cellFont
    RequstDescription.font = cellFont
    RequstDate.font = cellFont
     
    setLablesConstraint()
     
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
   
  func setLablesConstraint(){
//RequstTypeConstraint
    RequstType.translatesAutoresizingMaskIntoConstraints = false
    RequstType.topAnchor.constraint(equalTo: topAnchor ,constant: 10).isActive = true
    RequstType.heightAnchor.constraint(equalToConstant: 30)
    RequstType.trailingAnchor.constraint(equalTo: trailingAnchor , constant: -20 ).isActive = true
     
//RequstIDConstraint
    RequstID.translatesAutoresizingMaskIntoConstraints = false
    RequstID.topAnchor.constraint(equalTo: RequstType.bottomAnchor , constant: 10).isActive = true
    RequstID.heightAnchor.constraint(equalToConstant: 30)
    RequstID.trailingAnchor.constraint(equalTo: trailingAnchor , constant: -20 ).isActive = true// constant will change
     
    RequstDescription.translatesAutoresizingMaskIntoConstraints = false
    RequstDescription.topAnchor.constraint(equalTo: RequstID.bottomAnchor , constant: 10).isActive = true
    RequstDescription.heightAnchor.constraint(equalToConstant: 30)
    RequstDescription.trailingAnchor.constraint(equalTo: trailingAnchor , constant: -20 ).isActive = true
     
    RequstDate.translatesAutoresizingMaskIntoConstraints = false
    RequstDate.topAnchor.constraint(equalTo: RequstDescription.bottomAnchor , constant: 10).isActive = true
    RequstDate.heightAnchor.constraint(equalToConstant: 30)
    RequstDate.trailingAnchor.constraint(equalTo: trailingAnchor , constant: -20 ).isActive = true
  }
   
   
   
   
}
