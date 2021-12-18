//
//  AllUsersCell.swift
//  Gheras
//
//  Created by AlDanah Aldohayan on 18/12/2021.
//

import UIKit

class AllUsersCell : UITableViewCell {
   
    var pointLabel = UILabel()
    var nameLabel = UILabel()
    var userIconImageView = UIImageView()
    
  var page: Page? {
    didSet{
      guard let unwrappedPage = page else {return}
       
       
      let attributedText = NSMutableAttributedString(string: unwrappedPage.hederText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)])
       
      attributedText.append(NSAttributedString(string: "\n\n\n\(unwrappedPage.bodyText)", attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor:UIColor.gray]))
       
      descriptionTextView.attributedText = attributedText
      descriptionTextView.textAlignment = .center
    }
  }
    
  private let treeimageView : UIImageView = {
    var treeImage = UIImage(named: "Gheras")
    let imageView = UIImageView(image: treeImage)
    //This enables autolayout for our imageView
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
   
  private let descriptionTextView: UITextView = {
    let textView = UITextView()
     
    let attributedText = NSMutableAttributedString(string: "HI teeeeeesst join use today", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
     
     
    attributedText.append(NSAttributedString(string: "\n\n\nteest1", attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor:UIColor.gray]))
    textView.attributedText = attributedText
    textView.translatesAutoresizingMaskIntoConstraints = false
    textView.textAlignment = .center
    textView.isEditable = false
    textView.isSelectable = false
    return textView
  }()
   
//  override init(frame: CGRect) {
//    super.init(frame: frame)
//    backgroundColor = .white
//    setupLayout()
//  }
  //make sure you appy
  private func setupLayout(){
    let topImageContainerView = UIView()
    addSubview(topImageContainerView)
    //enable auto Layout
     
    topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
    topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    topImageContainerView.addSubview(treeimageView)
    treeimageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
    treeimageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
    treeimageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.9).isActive = true
     
    topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
     
     
    //    descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor, constant: 150).isActive = true
     
    addSubview(descriptionTextView)
    descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
    descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
    descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
    descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
  }
   
   
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

