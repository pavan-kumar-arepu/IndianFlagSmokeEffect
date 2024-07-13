//
//  File.swift
//  
//
//  Created by Pavankumar Arepu on 13/07/24.
//

import Foundation
import UIKit

class SmokeEffectPresenter {
    static func presentSmokeEffect(from viewController: UIViewController) {
        let smokeModalViewController = SmokeModalViewController()
        smokeModalViewController.modalPresentationStyle = .overFullScreen
        viewController.present(smokeModalViewController, animated: true, completion: nil)
    }
}
