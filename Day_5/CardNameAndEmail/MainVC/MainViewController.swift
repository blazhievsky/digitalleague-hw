//
//  ViewController.swift
//  ClassWork
//
//  Created by Артем Блажиевский on 22.02.2022.
//
import UIKit

class MainViewController: UIViewController {
    
    lazy var authorHomeWorkLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ДЗ Артема Блажиевского"
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    lazy var nameCardTransitionButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Перейти к валидации имени ↑", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 30
        button.addTarget(self, action: #selector(openNameCardVC), for: .touchUpInside)
        return button
    }()
    
    lazy var emailCardTransitionButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Перейти к валидации почты →", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 30
        button.addTarget(self, action: #selector(openEmailCardVC), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}
extension MainViewController {
    private func configureView() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(authorHomeWorkLabel)
        view.addSubview(nameCardTransitionButton)
        view.addSubview(emailCardTransitionButton)
        
        NSLayoutConstraint.activate([
            authorHomeWorkLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            authorHomeWorkLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nameCardTransitionButton.topAnchor.constraint(equalTo: authorHomeWorkLabel.bottomAnchor, constant: 20),
            nameCardTransitionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameCardTransitionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameCardTransitionButton.heightAnchor.constraint(equalToConstant: 70),
            
            emailCardTransitionButton.topAnchor.constraint(equalTo: nameCardTransitionButton.bottomAnchor, constant: 40),
            emailCardTransitionButton.leadingAnchor.constraint(equalTo: nameCardTransitionButton.leadingAnchor),
            emailCardTransitionButton.trailingAnchor.constraint(equalTo: nameCardTransitionButton.trailingAnchor),
            emailCardTransitionButton.heightAnchor.constraint(equalTo: nameCardTransitionButton.heightAnchor)
        ])
    }
    
    @objc
    private func openNameCardVC() {
        let nameCardVC = NameCardViewController()
        navigationController?.present(nameCardVC, animated: true)
    }
    
    @objc
    private func openEmailCardVC() {
        let emailCardVC = EmailCardViewController()
        navigationController?.pushViewController(emailCardVC, animated: true)
    }
}




