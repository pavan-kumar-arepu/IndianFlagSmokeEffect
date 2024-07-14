//
//  File.swift
//  
//
//  Created by Pavankumar Arepu on 13/07/24.
//

import UIKit
import SwiftUI

internal class SmokeModalViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the background color to black
        view.backgroundColor = .black
        
        // Add a close button to the top right corner of the view
        let closeButton = UIButton(type: .system)
        closeButton.setTitle("Close", for: .normal)
        closeButton.setTitleColor(.white, for: .normal)
        closeButton.backgroundColor = .systemBlue.withAlphaComponent(0.5)
        closeButton.layer.cornerRadius = 8
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(closeButton)
        
        // Set constraints for the close button
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.widthAnchor.constraint(equalToConstant: 60),
            closeButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // Create a stack view for the descriptions of the colors
        let descriptionStackView = UIStackView()
        descriptionStackView.axis = .vertical
        descriptionStackView.alignment = .center
        descriptionStackView.spacing = 10
        
        // Add description labels to the stack view
        let saffronDescription = createDescriptionLabel(text: "Saffron: Courage and Sacrifice")
        let whiteDescription = createDescriptionLabel(text: "White: Peace and Truth")
        let greenDescription = createDescriptionLabel(text: "Green: Faith and Chivalry")
        
        descriptionStackView.addArrangedSubview(saffronDescription)
        descriptionStackView.addArrangedSubview(whiteDescription)
        descriptionStackView.addArrangedSubview(greenDescription)
        
        // Create a stack view for the smoke animation views
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 10
        
        // Create and add the smoke animation views to the stack view
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
        
        // Add the description stack view and the animation stack view to the main view
        descriptionStackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionStackView)
        view.addSubview(stackView)
        
        // Set constraints for the description stack view and the animation stack view
        NSLayoutConstraint.activate([
            descriptionStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            descriptionStackView.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 20),
            
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: descriptionStackView.bottomAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    /// Creates a UILabel for the description of a color
    /// - Parameter text: The text to be displayed in the label
    /// - Returns: A configured UILabel instance
    private func createDescriptionLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }
    
    /// Action for the close button to dismiss the modal view
    @objc private func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}

