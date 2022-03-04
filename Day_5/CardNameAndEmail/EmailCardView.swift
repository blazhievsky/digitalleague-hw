//
//  EmailCardView.swift
//  ClassWork
//
//  Created by Artem Blazhievsky on 02.03.2022.
//

import Foundation

import UIKit

class EmailCardView: UIView{
    
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

extension EmailCardView {
    func configureView() {
        self.backgroundColor = .systemBackground
        
        self.addSubview(emailCardView)
        emailCardView.addSubview(emailTextField)
        emailCardView.addSubview(emailValidateButton)
        emailCardView.addSubview(emailValidationResultLabel)
        
        NSLayoutConstraint.activate([
            //            emailCardView.topAnchor.constraint(equalTo: nameCardView.bottomAnchor, constant: 50),
            //            emailCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            //            emailCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            //
            //            emailTextField.topAnchor.constraint(equalTo: emailCardView.topAnchor, constant: 16),
            //            emailTextField.leadingAnchor.constraint(equalTo: emailCardView.leadingAnchor, constant: 16),
            //            emailTextField.trailingAnchor.constraint(equalTo: emailCardView.trailingAnchor, constant: -16),
            //
            //            emailValidateButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            //            emailValidateButton.leadingAnchor.constraint(equalTo: emailCardView.leadingAnchor, constant: 16),
            //            emailValidateButton.trailingAnchor.constraint(equalTo: emailCardView.trailingAnchor, constant: -16),
            //
            //            emailValidationResultLabel.topAnchor.constraint(equalTo: emailValidateButton.bottomAnchor, constant: 16),
            //            emailValidationResultLabel.leadingAnchor.constraint(equalTo: emailCardView.leadingAnchor, constant: 16),
            //            emailValidationResultLabel.trailingAnchor.constraint(equalTo: emailCardView.trailingAnchor, constant: -16),
            //            emailValidationResultLabel.bottomAnchor.constraint(equalTo: emailCardView.bottomAnchor, constant: -16),
        ])
    }
}


extension EmailCardView {
    
    func offsetContentWillShowAndHideKeyboard() {
        Foundation.NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        Foundation.NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)}
    
    
    @objc
    private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.emailCardView.frame.minY >= keyboardSize.maxY {
                self.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc
    private func keyboardWillHide(notification: NSNotification) {
        if self.frame.origin.y != 0 {
            self.frame.origin.y = 0
        }
    }
}
