//
//  nameCardView.swift
//  ClassWork
//
//  Created by Artem Blazhievsky on 02.03.2022.
//

import Foundation
import UIKit

//MARK: - enum
typealias regExString = String

enum ScreenValidationType: regExString {
    case name = "[A-Za-zА-ЯЁа-яё-]{2,}+\\s{1}+[A-Za-zА-ЯЁа-яё-]{2,}"
    case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
}

class cardsView: UIView  {
    
    private var screenValidationType: ScreenValidationType
    
    private lazy var cardView: UIView = {
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
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        switch screenValidationType {
        case .name:
            textField.placeholder = "введите имя..."
        case .email:
            textField.placeholder = "введите почту..."
        }
        
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemBackground
        return textField
    }()
    
    private lazy var validateButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        switch screenValidationType {
        case .name:
            button.setTitle("Валидировать имя", for: .normal)
        case . email:
            button.setTitle("Валидировать почту", for: .normal)
        }
        
        button.setTitle("Не дави на меня!", for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(didTapValidateButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var validationResultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ожидаю валидации"
        return label
    }()
    
    init(screenValidationType: ScreenValidationType) {
        self.screenValidationType = screenValidationType
        super.init(frame: .zero)
        configureView(view: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - extension
extension cardsView {
    func configureView(view: UIView) {
        self.backgroundColor = .tertiarySystemBackground
        
        self.addSubview(cardView)
        cardView.addSubview(textField)
        cardView.addSubview(validateButton)
        cardView.addSubview(validationResultLabel)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50),
            cardView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            cardView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            textField.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16),
            textField.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            
            validateButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 16),
            validateButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            validateButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            
            validationResultLabel.topAnchor.constraint(equalTo: validateButton.bottomAnchor, constant: 16),
            validationResultLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            validationResultLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            validationResultLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -16)
        ])
    }
 
//MARK: - objc method
    @objc
    private func didTapValidateButton() {
        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", ScreenValidationType.name.rawValue)
        let isValid = predicate.evaluate(with: textField.text)
        
        switch isValid {
        case true:
            validationResultLabel.text = "Валидация прошла успешно"
            validationResultLabel.textColor = .systemGreen
        case false:
            validationResultLabel.text = "В поле ошибка"
            validationResultLabel.textColor = .systemRed
            
            let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.07
            animation.repeatCount = 4
            animation.autoreverses = true
            animation.fromValue = NSValue(cgPoint: CGPoint(x: cardView.center.x - 10, y: cardView.center.y))
            animation.toValue = NSValue(cgPoint: CGPoint(x: cardView.center.x + 10, y: cardView.center.y))
            cardView.layer.add(animation, forKey: "position")
        }
    }
}


