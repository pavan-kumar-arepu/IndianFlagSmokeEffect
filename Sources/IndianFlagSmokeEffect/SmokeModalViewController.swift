//
//  File.swift
//  
//
//  Created by Pavankumar Arepu on 13/07/24.
//

import Foundation
import UIKit
import SwiftUI

internal class SmokeModalViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
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
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
        
        // Add Close Button
        let closeButton = UIButton(type: .system)
        closeButton.setTitle("Close", for: .normal)
        closeButton.setTitleColor(.white, for: .normal)
        closeButton.backgroundColor = .green.withAlphaComponent(0.5)
        closeButton.layer.cornerRadius = 8
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.widthAnchor.constraint(equalToConstant: 60),
            closeButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc private func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}
