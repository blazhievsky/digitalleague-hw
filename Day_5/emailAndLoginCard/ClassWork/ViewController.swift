//
//  ViewController.swift
//  ClassWork
//
//  Created by Артем Блажиевский on 22.02.2022.
//
import UIKit

class ViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    let validationСheck = { (regExString: String, predicate: NSPredicate, whatToCheck: UITextField) -> Bool in
        let regExString = regExString
        let predicate = predicate
        let isValid = predicate.evaluate(with: whatToCheck.text)
        return isValid
        }
    }



//extension ViewController {
//    private func configureView() {
//        view.backgroundColor = .systemBackground
//
//
//
//        NSLayoutConstraint.activate([
//
//            nameCardView.topAnchor.constraint(equalTo: authorHomeWorkLabel.topAnchor, constant: 50),
//            nameCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            nameCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//
//            nameTextField.topAnchor.constraint(equalTo: nameCardView.topAnchor, constant: 16),
//            nameTextField.leadingAnchor.constraint(equalTo: nameCardView.leadingAnchor, constant: 16),
//            nameTextField.trailingAnchor.constraint(equalTo: nameCardView.trailingAnchor, constant: -16),
//
//            nameValidateButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16),
//            nameValidateButton.leadingAnchor.constraint(equalTo: nameCardView.leadingAnchor, constant: 16),
//            nameValidateButton.trailingAnchor.constraint(equalTo: nameCardView.trailingAnchor, constant: -16),
//
//            nameValidationResultLabel.topAnchor.constraint(equalTo: nameValidateButton.bottomAnchor, constant: 16),
//            nameValidationResultLabel.leadingAnchor.constraint(equalTo: nameCardView.leadingAnchor, constant: 16),
//            nameValidationResultLabel.trailingAnchor.constraint(equalTo: nameCardView.trailingAnchor, constant: -16),
//            nameValidationResultLabel.bottomAnchor.constraint(equalTo: nameCardView.bottomAnchor, constant: -16),
//
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
//        ])
//    }
//
//    @objc
//    private func nameDidTapValidateButton() {
//        let regExString = "[A-Za-zА-ЯЁа-яё-]{2,}+\\s{1}+[A-Za-zА-ЯЁа-яё-]{2,}"
//        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regExString)
//        let isValid = predicate.evaluate(with: nameTextField.text)
//
//        switch isValid {
//        case true:
//            nameValidationResultLabel.text = "Валидация прошла успешно"
//            nameValidationResultLabel.textColor = .systemGreen
//        case false:
//            nameValidationResultLabel.text = "В поле ошибка"
//            nameValidationResultLabel.textColor = .systemRed
//
//            let animation = CABasicAnimation(keyPath: "position")
//            animation.duration = 0.07
//            animation.repeatCount = 4
//            animation.autoreverses = true
//            animation.fromValue = NSValue(cgPoint: CGPoint(x: nameCardView.center.x - 10, y: nameCardView.center.y))
//            animation.toValue = NSValue(cgPoint: CGPoint(x: nameCardView.center.x + 10, y: nameCardView.center.y))
//            nameCardView.layer.add(animation, forKey: "position")
//        }
//    }
//
//
//
//    @objc
//    private func emailDidTapValidateButton() {
//        let regExString = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regExString)
//        let isValid = predicate.evaluate(with: emailTextField.text)
//
//        switch isValid {
//        case true:
//            emailValidationResultLabel.text = "Валидация прошла успешно"
//            emailValidationResultLabel.textColor = .systemGreen
//        case false:
//            emailValidationResultLabel.text = "В поле ошибка"
//            emailValidationResultLabel.textColor = .systemRed
//
//            let animation = CABasicAnimation(keyPath: "position")
//            animation.duration = 0.07
//            animation.repeatCount = 4
//            animation.autoreverses = true
//            animation.fromValue = NSValue(cgPoint: CGPoint(x: emailCardView.center.x - 10, y: emailCardView.center.y))
//            animation.toValue = NSValue(cgPoint: CGPoint(x: emailCardView.center.x + 10, y: emailCardView.center.y))
//            emailCardView.layer.add(animation, forKey: "position")
//        }
//    }
//}
//
