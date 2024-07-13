//
//  File.swift
//  
//
//  Created by Pavankumar Arepu on 13/07/24.
//  ParticleImageGenerator.swift

import Foundation


//public struct ParticleImageGenerator {
//    public static func generateParticleImage(size: CGSize) -> UIImage
//}
//
//// IndianFlagSmokeView.swift
//
//public struct IndianFlagSmokeView: UIViewRepresentable {
//    public init(particleColor: UIColor)
//    public func makeUIView(context: Context) -> UIView
//    public func updateUIView(_ uiView: UIView, context: Context)
//}
//
//// SmokeModalViewController.swift
//
//public class SmokeModalViewController: UIViewController {
//    public override func viewDidLoad()
//}
//
//// SmokeEffectPresenter.swift
//
//public class SmokeEffectPresenter {
//    public static func presentSmokeEffect(from viewController: UIViewController)
//}

import UIKit

public struct ParticleImageGenerator {
    public static func generateParticleImage(size: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        
        let image = renderer.image { context in
            let particleColor = UIColor(white: 1.0, alpha: 0.5)
            context.cgContext.setFillColor(particleColor.cgColor)
            context.cgContext.fillEllipse(in: CGRect(origin: .zero, size: size))
        }
        
        return image
    }
}
