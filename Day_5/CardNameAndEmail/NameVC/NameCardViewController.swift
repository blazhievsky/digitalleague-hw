//
//  NameCardViewController.swift
//  ClassWork
//
//  Created by Artem Blazhievsky on 02.03.2022.
//

import Foundation
import UIKit

final class NameCardViewController: UIViewController  {
    
    private var nameCardView = NameCardView()
    
    init(_ nameCardView: NameCardView) {
        self.nameCardView = nameCardView
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = nameCardView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameCardView.configureView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.view.subviews.first?.frame = self.view.frame
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
