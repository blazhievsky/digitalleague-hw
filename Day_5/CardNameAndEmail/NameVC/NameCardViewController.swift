//
//  NameCardViewController.swift
//  ClassWork
//
//  Created by Artem Blazhievsky on 02.03.2022.
//

import Foundation
import UIKit

final class NameCardViewController: UIViewController  {
    
    override func loadView() {
        view = cardsView(screenValidationType: .name)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
