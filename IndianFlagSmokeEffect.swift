//
//  File.swift
//  IndianFlagSmokeEffect
//
//  Created by Pavankumar Arepu on 12/07/24.
//
import SwiftUI
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

public struct IndianFlagSmokeView: UIViewRepresentable {
    var particleColor: UIColor
    
    public init(particleColor: UIColor) {
        self.particleColor = particleColor
    }
    
    public func makeUIView(context: Context) -> UIView {
        let smokeView = UIView()
        
        let emitterLayer = CAEmitterLayer()
        emitterLayer.emitterPosition = CGPoint(x: 60, y: 40)
        emitterLayer.emitterSize = CGSize(width: smokeView.bounds.size.width, height: 1)
        emitterLayer.emitterShape = .line
        emitterLayer.emitterCells = [createSmokeParticleCell()]
        
        smokeView.layer.addSublayer(emitterLayer)
        
        return smokeView
    }
    
    public func updateUIView(_ uiView: UIView, context: Context) {
        // Update code if needed
    }
    
    private func createSmokeParticleCell() -> CAEmitterCell {
        let cell = CAEmitterCell()
        cell.birthRate = 200
        cell.lifetime = 15
        cell.velocity = 50
        cell.velocityRange = 50
        cell.emissionLongitude = .pi
        cell.emissionRange = .pi / 4
        cell.scale = 0.1
        cell.scaleRange = 0.05
        
        cell.color = particleColor.cgColor
        
        cell.contents = ParticleImageGenerator.generateParticleImage(size: CGSize(width: 5, height: 5)).cgImage
        
        return cell
    }
}

public class ShakeDetector: UIResponder, UIApplicationDelegate {
    private var window: UIWindow?
    private var isShakeEnabled = false
    private var smokeViews = [UIView]()
    
    public func enableShakeDetection(in window: UIWindow?) {
        self.window = window
        self.isShakeEnabled = true
    }
    
    public override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        guard isShakeEnabled, motion == .motionShake else { return }
        
        if let rootView = window?.rootViewController?.view {
            let smokeView = UIView(frame: rootView.bounds)
            smokeView.backgroundColor = .clear
            
            let saffronView = IndianFlagSmokeView(particleColor: .orange).makeUIView(context: .init())
            let whiteView = IndianFlagSmokeView(particleColor: .white).makeUIView(context: .init())
            let greenView = IndianFlagSmokeView(particleColor: .green).makeUIView(context: .init())
            
            smokeView.addSubview(saffronView)
            smokeView.addSubview(whiteView)
            smokeView.addSubview(greenView)
            
            rootView.addSubview(smokeView)
            smokeViews.append(smokeView)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                smokeView.removeFromSuperview()
                if let index = self.smokeViews.firstIndex(of: smokeView) {
                    self.smokeViews.remove(at: index)
                }
            }
        }
    }
}
