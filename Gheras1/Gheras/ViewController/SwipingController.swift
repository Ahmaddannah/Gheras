//
//  SwipingController.swift
//  Gheras
//
//  Created by AlDanah Aldohayan on 18/12/2021.
//
import UIKit
class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    let pages = [
        Page(imageName: "Gheras", hederText: " مرحبا بكم في غِراس ",
             bodyText: "نحن عازمون بطموحنا الكبير ، وخبراتنا الواسعة ، وإبداعنا اللامحدود على أن نصنع الفرق."),
        
        Page(imageName: "Gheras", hederText: "من منطلق حديث الرسول ﷺ  ",
             bodyText: " قال: إن قامت الساعة وفي يد أحدكم فسيلة فإن استطاع أن لاتقوم حتى يغرسها فليغرسها"),
        
        Page(imageName: "Gheras", hederText: "غِراس",
             bodyText: "من هذا المنطلق ابدا اصنع الفارق واغرس غرستك")
        
    ]
    let xButton = UIButton(frame: CGRect(x: 10, y: 40, width: 50, height: 50))
    
    var index = 0
    //make sure you applay the corrct encapsulation principles in your classes
    private let previouesButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("السابق", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlelPrev), for: .touchUpInside)
        return button
    }()
    @objc private func handlelPrev() {
        let nextIndex = max(pageControl.currentPage - 1 , 0)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
    }
    
    private let nextButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("التالي", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainGreen, for: .normal)
        button.addTarget(self, action: #selector(handlelNext), for: .touchUpInside)
        return button
    }()
    @objc private func handlelNext() {
        let nextIndex = min(pageControl.currentPage + 1 , pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        //
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .mainGreen
        return pc
    }()
    
    fileprivate func setupButtonControls(){
        let buttomControlsStackView = UIStackView(arrangedSubviews: [previouesButton, pageControl, nextButton])
        buttomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttomControlsStackView.distribution = .fillEqually
        
        view.addSubview(buttomControlsStackView)
        
        NSLayoutConstraint.activate([
            buttomControlsStackView.bottomAnchor.constraint(equalTo:
                                                                view.safeAreaLayoutGuide.bottomAnchor),
            buttomControlsStackView.leadingAnchor.constraint(equalTo:
                                                                view.safeAreaLayoutGuide.leadingAnchor),
            buttomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            buttomControlsStackView.heightAnchor.constraint(equalToConstant: 50.0)
        ])
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonControls()
        collectionView?.backgroundColor = .clear
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
        xButton.addTarget(self, action: #selector(xbutton), for: .touchUpInside)
        xButton.setTitle("تخطي", for: .normal)
        xButton.setTitleColor(.darkGray, for: .normal)
        view.addSubview(xButton)
    }
    
    @objc func xbutton() {
//        index += 1
//        if index == 3 {
            let vc = SignInVC()
        vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated:true, completion:nil)
//        }
    }
    
    override var prefersStatusBarHidden: Bool {
        
        return true
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIColor{
    static var mainGreen = UIColor(red: 0.5053240061, green: 0.7041016221, blue: 0.5964052677, alpha: 1)
}

