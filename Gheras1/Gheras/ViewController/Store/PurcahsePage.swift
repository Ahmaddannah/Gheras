//
//  PurcahsePage.swift
//  Gheras
//
//  Created by AlDanah Aldohayan on 16/12/2021.
//

import UIKit

class PurcahsePage: UIViewController {
    

    let transferLabel : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        return label

    }()
    let priceLabel2 : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .red
        return label

    }()
    let purchaseLabel : UILabel = {
        let label = UILabel()
        label.text = "سلة المشتريات"
        label.backgroundColor = #colorLiteral(red: 0.04236891121, green: 0.6102550626, blue: 0.2603748143, alpha: 1)
        label.textColor = .white
        return label

    }()
    let checkButton : UIButton = {
        let butt  = UIButton()
//        butt.setImage(.init(systemName: "cart.badge.plus"), for: .normal)
        butt.setTitle("checkOut", for: .normal)
        butt.backgroundColor = #colorLiteral(red: 0.04236891121, green: 0.6102550626, blue: 0.2603748143, alpha: 1)
        butt.layer.cornerRadius = 10
        butt.layer.cornerRadius = butt.frame.height/2
        butt.setTitleColor(#colorLiteral(red: 0.04236891121, green: 0.6102550626, blue: 0.2603748143, alpha: 1), for: .normal)
        butt.clipsToBounds = true
        butt.setTitleColor(.white, for: .normal)
//        butt.tintColor = .black
        return butt
        
    }()
    
    
    let productLabel : UILabel = {
        let label = UILabel()
        label.text =  "اسم المنتج"
        label.textColor = .black
        return label

    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(purchaseLabel)
        view.backgroundColor = .white
        view.addSubview(checkButton)
        view.addSubview(productLabel)
        view.addSubview(transferLabel)
        view.addSubview(priceLabel2)
       

        
        
    }
    override func viewDidLayoutSubviews() {
        purchaseLabel.frame = CGRect(x: 150, y: 50, width: 120, height: 60)
        checkButton.frame = CGRect(x: 120, y: 600, width: 200, height: 60)
        productLabel.frame = CGRect(x: 280, y: 200, width: 200, height: 60)
        transferLabel.frame = CGRect(x: 250, y: 250, width: 200, height: 60)
        priceLabel2.frame = CGRect(x: 150, y: 250, width: 200, height: 60)



    }
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        if let data = defaults.object(forKey: "SavedName") {
            if let message = data as? String{
                self.transferLabel.text = message
            }
            if let data2 = defaults.object(forKey: "SavedPrice") {
                if let message = data2 as? String{
                    self.priceLabel2.text = message
                }
            }
                
    }
    

   

}
}
