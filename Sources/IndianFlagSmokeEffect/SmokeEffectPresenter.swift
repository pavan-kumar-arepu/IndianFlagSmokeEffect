//
//  File.swift
//  
//
//  Created by Pavankumar Arepu on 13/07/24.
//

import Foundation
import UIKit

public class SmokeEffectPresenter {
    public static func presentSmokeEffect(from viewController: UIViewController) {
        let smokeModalViewController = SmokeModalViewController()
        smokeModalViewController.modalPresentationStyle = .popover
        viewController.present(smokeModalViewController, animated: true, completion: nil)
    }
}
