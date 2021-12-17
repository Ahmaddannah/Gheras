// questionsViewController.swift
// Profile
//
// Created by TAGHREED on 11/05/1443 AH.
//


import UIKit

class questionsViewController: UIViewController {
    var stackview = UIStackView()
    var question1 = UILabel()
    var question2 = UILabel()
    var question3 = UILabel()
    // var question4 = UILabel()
    var answer1 = UILabel()
    var answer2 = UILabel()
    var answer3 = UILabel()
    // var answer4 = UILabel()
    
    //UIButton-dismissBtn
    let dismissBtn : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "x.circle"), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.tintColor =  .gray
        button.frame.size = CGSize(width: 40, height: 40)
        button.layer.cornerRadius = button.frame.width/2
        button.addTarget(self, action: #selector(dismissBtnAction), for: .touchDown)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setLablesVlue()
        setLablesConstraint()
    }
    
    func setLablesVlue(){
        view.backgroundColor = .white
        view.addSubview(stackview)
        stackview.addSubview(question1)
        stackview.addSubview(question2)
        stackview.addSubview(question3)
        //stackview.addSubview(question4)
        stackview.addSubview(answer1)
        stackview.addSubview(answer2)
        stackview.addSubview(answer3)
        //stackview.addSubview(answer4)
    }
    
    func setLablesConstraint(){
        let width = view.frame.width - 40
        let height = view.frame.height - 100
        var y = 40.0
        // stack view
        stackview.distribution = .fill
        stackview.axis = .vertical
        stackview.frame = CGRect(x: 0, y: 0, width: width, height: height)
        stackview.center = view.center
        // stackview.backgroundColor = .gray
        //question1
        question1.frame = CGRect(x: 0, y: y, width: width, height: height/8)
        question1.font = UIFont.systemFont(ofSize: 18)
        question1.text = "السؤال الأول: من نحن؟"
        question1.textAlignment = .right
        question1.numberOfLines = 3
        y += question1.frame.height
        y += 10
        //answer1
        answer1.frame = CGRect(x: 0, y: y, width: width, height: height/6)
        answer1.font = UIFont.systemFont(ofSize: 16)
        answer1.text = "الاجابة هنا"
        answer1.numberOfLines = 4
        answer1.textAlignment = .right
        answer1.textColor = .systemGreen
        y += answer1.frame.height
        y += 20
        //question2
        question2.frame = CGRect(x: 0, y: y, width: width, height: height/8)
        question2.font = UIFont.systemFont(ofSize: 18)
        question2.text = "السؤال الثاني: من نحن؟"
        question2.textAlignment = .right
        question2.numberOfLines = 3
        y += question2.frame.height
        y += 10
        //answer2
        answer2.frame = CGRect(x: 0, y: y, width: width, height: height/6)
        answer2.font = UIFont.systemFont(ofSize: 16)
        answer2.text = "الاجابة هنا"
        answer2.numberOfLines = 4
        answer2.textAlignment = .right
        answer2.textColor = .systemGreen
        y += answer2.frame.height
        y += 20
        //question3
        question3.frame = CGRect(x: 0, y: y, width: width, height: height/8)
        question3.font = UIFont.systemFont(ofSize: 18)
        question3.text = "السؤال الثالث: من نحن؟"
        question3.textAlignment = .right
        question3.numberOfLines = 3
        y += question3.frame.height
        y += 10
        //answer3
        answer3.frame = CGRect(x: 0, y: y, width: width, height: height/6)
        answer3.font = UIFont.systemFont(ofSize: 16)
        answer3.text = "الاجابة هنا"
        answer3.numberOfLines = 4
        answer3.textAlignment = .right
        answer3.textColor = .systemGreen
        y += answer3.frame.height
        y += 20
        
    }
    
    
    @objc func dismissBtnAction() {
        dismiss(animated: true, completion: nil)
        
        
    }
}


//MARK: -NSLayoutConstraint
extension questionsViewController {
    private func setupView() {
        view.addSubview(dismissBtn)
        NSLayoutConstraint.activate([
            dismissBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            dismissBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dismissBtn.heightAnchor.constraint(equalToConstant: 40),
            dismissBtn.widthAnchor.constraint(equalToConstant: 40),
        ])
    }
}
