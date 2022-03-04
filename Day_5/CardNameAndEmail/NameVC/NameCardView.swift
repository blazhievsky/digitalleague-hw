//
//  nameCardView.swift
//  ClassWork
//
//  Created by Artem Blazhievsky on 02.03.2022.
//

import Foundation
import UIKit

class NameCardView: UIView  {
    
    private lazy var nameCardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 4, height: 4)
        view.layer.shadowOpacity = 0.7
        view.layer.shadowRadius = 4
        view.layer.cornerRadius = 20
        return view
    } ()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "введите имя..."
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemBackground
        return textField
    }()
    
    private lazy var nameValidateButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Валидировать имя", for: .normal)
        button.setTitle("Не дави на меня!", for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        //        button.addTarget(self,
        //                         action: #selector(nameDidTapValidateButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var nameValidationResultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ожидаю валидации"
        return label
    }()
}


extension NameCardView {
    func configureView() {
        self.backgroundColor = .tertiarySystemBackground
        
        self.addSubview(nameCardView)
        nameCardView.addSubview(nameTextField)
        nameCardView.addSubview(nameValidateButton)
        nameCardView.addSubview(nameValidationResultLabel)
        
        NSLayoutConstraint.activate([
            nameCardView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50),
            nameCardView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            nameCardView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            nameTextField.topAnchor.constraint(equalTo: nameCardView.topAnchor, constant: 16),
            nameTextField.leadingAnchor.constraint(equalTo: nameCardView.leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: nameCardView.trailingAnchor, constant: -16),
            
            nameValidateButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16),
            nameValidateButton.leadingAnchor.constraint(equalTo: nameCardView.leadingAnchor, constant: 16),
            nameValidateButton.trailingAnchor.constraint(equalTo: nameCardView.trailingAnchor, constant: -16),
            
            nameValidationResultLabel.topAnchor.constraint(equalTo: nameValidateButton.bottomAnchor, constant: 16),
            nameValidationResultLabel.leadingAnchor.constraint(equalTo: nameCardView.leadingAnchor, constant: 16),
            nameValidationResultLabel.trailingAnchor.constraint(equalTo: nameCardView.trailingAnchor, constant: -16),
            nameValidationResultLabel.bottomAnchor.constraint(equalTo: nameCardView.bottomAnchor, constant: -16),
        ])
        
        
        
    }
}

extension NameCardView {
    
    func offsetContentWillShowAndHideKeyboard() {
        Foundation.NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        Foundation.NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)}
    
    
    @objc
    private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.nameCardView.frame.minY >= keyboardSize.maxY {
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
