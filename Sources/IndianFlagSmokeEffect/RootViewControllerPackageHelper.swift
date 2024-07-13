//
//  File.swift
//  
//
//  Created by Pavankumar Arepu on 13/07/24.
//

import Foundation
import SwiftUI
import UIKit

struct RootViewControllerKey: EnvironmentKey {
    static var defaultValue: UIViewController? {
        return UIApplication.shared.windows.first?.rootViewController
    }
}

extension EnvironmentValues {
    var rootViewController: UIViewController? {
        get { self[RootViewControllerKey.self] }
        set { self[RootViewControllerKey.self] = newValue }
    }
}

public struct PackageRootViewControllerAccessor: UIViewControllerRepresentable {
    public init() {}

    public func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        DispatchQueue.main.async {
            viewController.viewDidAppear(false)
        }
        return viewController
    }
    
    public func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
