//
//  ViewController7.swift
//  Gheras
//
//  Created by Ahmad MacBook on 15/12/2021.
//

import UIKit

class StoreVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionViiew : UICollectionView?
    
    
    let buyButton : UIButton = {
        let butt  = UIButton()
        butt.setImage(.init(systemName: "cart.badge.plus"), for: .normal)
        butt.backgroundColor = .white
        butt.layer.cornerRadius = 10
        butt.setTitleColor(#colorLiteral(red: 0.04236891121, green: 0.6102550626, blue: 0.2603748143, alpha: 1), for: .normal)
        butt.clipsToBounds = true
//        butt.tintColor = .black
        return butt
        
    }()
    
    
//    var arrplants = [plant]()
    var arrPlants: [plant] = [
        plant(myimage: UIImage(named: "1")!, myLabel: "شتلة اكليل الجبل", priceLabel: "67 SAR"),
        plant(myimage: UIImage(named: "2")!, myLabel: "بنت القنصل وردية", priceLabel: "76 SAR"),
//        plant(myimage: UIImage(named: "3")!, myLabel: "اراليا", priceLabel: "98 SAR"),
//        plant(myimage: UIImage(named: "4")!, myLabel: "سرو عطري", priceLabel: "86 SAR"),
//        plant(myimage: UIImage(named: "5")!, myLabel: "صبار", priceLabel: "189 SAR"),
//        plant(myimage: UIImage(named: "6")!, myLabel:   "شتلة زيتون اوروبي", priceLabel: "87 SAR"),
//        plant(myimage: UIImage(named: "8")!, myLabel: "شجرة ليمون" ,priceLabel: "90 SAR"),
//        plant(myimage: UIImage(named: "10")!, myLabel: "دراسينا سينتو", priceLabel: "87 SAR"),
//        plant(myimage: UIImage(named: "11")!, myLabel: "الاشرعة البيضاء", priceLabel: "109 SAR"),
        plant(myimage: UIImage(named: "12")!, myLabel: "اجلونيما", priceLabel: "69"),
        plant(myimage: UIImage(named: "13")!, myLabel: "نتوريوم ازهار وردية", priceLabel: "189")


    ]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = " online store"
//        navigationItem.rightBarButtonItem = UIBarButtonItem (title: "ok", style: .plain, target: self, action: #selector(<#T##@objc method#>))
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionViiew = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionViiew = collectionViiew else {
            return
        }
        
        collectionViiew.register(customCollectionViewCell.self, forCellWithReuseIdentifier: customCollectionViewCell.identifier)

        view.addSubview(collectionViiew)
        view.addSubview(buyButton)
        buyButton.addTarget(self, action: #selector(buyAction), for: .touchDown)

        collectionViiew.frame = view.bounds
        collectionViiew.dataSource = self
        collectionViiew.delegate = self
//

       
        
    }
    @objc func buyAction() {
        let nextVC = PurcahsePage()
        self.present(nextVC, animated: true, completion: nil)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrPlants.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: customCollectionViewCell.identifier, for: indexPath) as! customCollectionViewCell
        cell.contentView.backgroundColor = .gray
        cell.contentView
        cell.myLabel.text = arrPlants[indexPath.row].myLabel
        cell.myimage.image = arrPlants[indexPath.row].myimage
        cell.priceLabel.text = arrPlants[indexPath.row].priceLabel
        


        return cell
}
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width * 0.48, height: self.view.frame.width * 0.6)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }
    override func viewDidLayoutSubviews() {
        buyButton.frame = CGRect(x: 300, y: 700, width: 50, height: 50)
        buyButton.layer.cornerRadius = buyButton.frame.height/2
        buyButton.clipsToBounds = true
    }
    
    struct plant {
        let  myimage : UIImage
        let myLabel : String
        let priceLabel : String
//        let myButton : UIButton
//        let button : UI
    }
    
}

