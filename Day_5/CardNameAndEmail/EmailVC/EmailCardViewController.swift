//
//  EmailCardViewController.swift
//  ClassWork
//
//  Created by Artem Blazhievsky on 02.03.2022.
//

import Foundation
import UIKit

final class EmailCardViewController: UIViewController {
    
    override func loadView() {
        view = cardsView(screenValidationType: .email)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
