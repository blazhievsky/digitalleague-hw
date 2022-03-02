//
//  ViewController.swift
//  ClassWork
//
//  Created by Артем Бумарь on 22.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
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
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Валидировать", for: .normal)
        button.setTitle("Не дави на меня!", for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.addTarget(self,
                         action: #selector(didTapValidateButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var nameValidationResultLabel: UILabel = {
        let label = UILabel()
        label.text = "Ожидаю валидации"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emailCardView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        return view
    } ()
    
    private lazy var emailTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "введите имя..."
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemBackground
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var emailValidateButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Валидировать", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.addTarget(self,
                         action: #selector(didTapValidateButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var emailValidationResultLabel: UILabel = {
        let label = UILabel()
        label.text = "Ожидаю валидации"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    
}

// MARK: - Private methods

extension ViewController {
    private func configureView() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(nameCardView)
        nameCardView.addSubview(nameTextField)
        nameCardView.addSubview(nameValidateButton)
        nameCardView.addSubview(nameValidationResultLabel)
        
        view.addSubview(emailCardView)
        emailCardView.addSubview(emailTextField)
        emailCardView.addSubview(emailValidateButton)
        emailCardView.addSubview(emailValidationResultLabel)
        
        
        NSLayoutConstraint.activate([
            nameCardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            nameCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            nameTextField.topAnchor.constraint(equalTo: nameCardView.topAnchor, constant: 16),
            nameTextField.leadingAnchor.constraint(equalTo: nameCardView.leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: nameCardView.trailingAnchor, constant: -16),
            
            nameValidateButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16),
            nameValidateButton.leadingAnchor.constraint(equalTo: nameCardView.leadingAnchor, constant: 16),
            nameValidateButton.trailingAnchor.constraint(equalTo: nameCardView.trailingAnchor, constant: -16),
            
            nameValidationResultLabel.topAnchor.constraint(equalTo: nameValidateButton.bottomAnchor, constant: 16),
            nameValidationResultLabel.leadingAnchor.constraint(equalTo: nameCardView.leadingAnchor, constant: 16),
            nameValidationResultLabel.trailingAnchor.constraint(equalTo: nameCardView.trailingAnchor, constant: -16),
            
            emailCardView.topAnchor.constraint(equalTo: nameCardView.bottomAnchor, constant: 200),
            emailCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            emailCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            emailTextField.topAnchor.constraint(equalTo: emailCardView.topAnchor, constant: 16),
            emailTextField.leadingAnchor.constraint(equalTo: emailCardView.leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: emailCardView.trailingAnchor, constant: -16),
            
            emailValidateButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            emailValidateButton.leadingAnchor.constraint(equalTo: emailCardView.leadingAnchor, constant: 16),
            emailValidateButton.trailingAnchor.constraint(equalTo: emailCardView.trailingAnchor, constant: -16),
            
            emailValidationResultLabel.topAnchor.constraint(equalTo: emailValidateButton.bottomAnchor, constant: 16),
            emailValidationResultLabel.leadingAnchor.constraint(equalTo: emailCardView.leadingAnchor, constant: 16),
            emailValidationResultLabel.trailingAnchor.constraint(equalTo: emailCardView.trailingAnchor, constant: -16),
            emailValidationResultLabel.bottomAnchor.constraint(equalTo: emailCardView.bottomAnchor, constant: -16),
            
        ])
    }

    @objc
    private func didTapValidateButton() {
        let regExString = "[A-Za-zА-ЯЁа-яё-]{2,}+\\s{1}+[A-Za-zА-ЯЁа-яё-]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regExString)
        let isValid = predicate.evaluate(with: nameTextField.text)

        nameValidationResultLabel.text = isValid ? "Валидация прошла успешно" : "В поле ошибка"
        nameValidationResultLabel.textColor = isValid ? .systemGreen : .systemRed

    }

}

