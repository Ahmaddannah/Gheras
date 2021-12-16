//
//  customCollectionViewCell.swift
//  Gheras
//
//  Created by AlDanah Aldohayan on 16/12/2021.
//

import UIKit

class customCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "coustomCollectionViewCell"
     
      let myimage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "plant")
        return imageView
         
      }()
      var myLabel : UILabel = {
        let label = UILabel()
        label.text = "نبتات زينه"
        label.font = UIFont(name: "ArialRoundedMTBold", size: 15)
        return label
         
      }()
      let priceLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "ArialRoundedMTBold", size: 10)

        return label
         
      }()
      let myButton : UIButton = {
        let butt = UIButton()
    //    butt.setImage(.init(systemName: " plus "), for: .normal)
        butt.setTitle("أضف الى السلة  ", for: .normal)
        butt.titleLabel?.font = UIFont(name: "ArialRoundedMTBold", size: 13)
        butt.setTitleColor(.black, for: .normal)
        butt.backgroundColor = .white
        butt.layer.cornerRadius = 15
    //    butt.layer.cornerRadius = butt.frame.height/2
        butt.clipsToBounds = true
        butt.tintColor = .black
         

         
        return butt
         
      }()
      
      override init(frame: CGRect) {
        super .init(frame: frame)
        contentView.addSubview(priceLabel)
        contentView.addSubview(myLabel)
        contentView.addSubview(myimage)
        contentView.addSubview(myButton)
        myButton.addTarget(self, action: #selector(addToCart), for: .touchDown)

      }
       
      required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
      }
       
       
       
      override func layoutSubviews() {
         super.layoutSubviews()
       
        myLabel.frame = CGRect(x: 80, y: contentView.frame.size.height - 60, width: contentView.frame.width - 10, height: 10)
        myimage.frame = CGRect(x: 5, y: 10, width: contentView.frame.width - 10, height: contentView.frame.height - 90)
        myButton.frame = CGRect(x: 5, y: contentView.frame.size.height - 40, width: contentView.frame.width - 10, height: 30)
        priceLabel.frame = CGRect(x: 10, y: contentView.frame.size.height - 70, width: contentView.frame.width - 10, height: 30)
      }
      @objc func addToCart() {
    //    let secondVC = purcahsePage()
    //    secondVC.plantName = myLabel
      }
       
    }
