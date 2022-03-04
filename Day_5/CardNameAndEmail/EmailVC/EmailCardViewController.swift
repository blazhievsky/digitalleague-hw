//
//  EmailCardViewController.swift
//  ClassWork
//
//  Created by Artem Blazhievsky on 02.03.2022.
//

import Foundation
import UIKit

final class EmailCardViewController: UIViewController {
    
    private var emailCardView: EmailCardView
    
    init(_ emailCardView: EmailCardView) {
        self.emailCardView = emailCardView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = emailCardView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailCardView.configureView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.view.subviews.first?.frame = self.view.frame
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
