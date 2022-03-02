//
//  NameCardViewController.swift
//  ClassWork
//
//  Created by Artem Blazhievsky on 02.03.2022.
//

import Foundation
import UIKit

class NameCardViewController: UIViewController  {
    
    private lazy var nameCardView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        return view
    } ()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "введите имя..."
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemBackground
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var nameValidateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Валидировать имя", for: .normal)
        button.setTitle("Не дави на меня!", for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
//        button.addTarget(self,
//                         action: #selector(nameDidTapValidateButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var nameValidationResultLabel: UILabel = {
        let label = UILabel()
        label.text = "Ожидаю валидации"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}


extension NameCardViewController {
    private func configureNameView() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(nameCardView)
        nameCardView.addSubview(nameTextField)
        nameCardView.addSubview(nameValidateButton)
        nameCardView.addSubview(nameValidationResultLabel)
        
        NSLayoutConstraint.activate([
            nameCardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            nameCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        
        
        ])
        
        
        
}
}
