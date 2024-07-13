//
//  File.swift
//  
//
//  Created by Pavankumar Arepu on 13/07/24.
//

import Foundation
import UIKit
import SwiftUI

public class SmokeModalViewController: UIViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 10
        
        let saffronHostingController = UIHostingController(rootView: IndianFlagSmokeView(particleColor: .orange))
        let whiteHostingController = UIHostingController(rootView: IndianFlagSmokeView(particleColor: .white))
        let greenHostingController = UIHostingController(rootView: IndianFlagSmokeView(particleColor: .green))
        
        addChild(saffronHostingController)
        addChild(whiteHostingController)
        addChild(greenHostingController)
        
        stackView.addArrangedSubview(saffronHostingController.view)
        stackView.addArrangedSubview(whiteHostingController.view)
        stackView.addArrangedSubview(greenHostingController.view)
        
        saffronHostingController.didMove(toParent: self)
        whiteHostingController.didMove(toParent: self)
        greenHostingController.didMove(toParent: self)
        
        stackView.frame = view.bounds
        view.addSubview(stackView)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
