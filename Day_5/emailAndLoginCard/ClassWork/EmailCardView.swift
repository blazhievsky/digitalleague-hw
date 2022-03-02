//
//  EmailCardViewController.swift
//  ClassWork
//
//  Created by Artem Blazhievsky on 02.03.2022.
//

import Foundation
import UIKit

class EmailCardViewController: UIViewController {
   
    private lazy var emailCardView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    } ()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "введите почту..."
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemBackground
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var emailValidateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Валидировать почту", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        //button.addTarget(self, action: #selector(emailDidTapValidateButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var emailValidationResultLabel: UILabel = {
        let label = UILabel()
        label.text = "Ожидаю валидации"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}

extension EmailCardViewController {
    private func configureNameView() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(emailCardView)
        emailCardView.addSubview(emailTextField)
        emailCardView.addSubview(emailValidateButton)
        emailCardView.addSubview(emailValidationResultLabel)
}
}
