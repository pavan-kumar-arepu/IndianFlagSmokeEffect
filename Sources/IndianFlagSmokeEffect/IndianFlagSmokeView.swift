//
//  File.swift
//  
//
//  Created by Pavankumar Arepu on 13/07/24.
//

import Foundation
import SwiftUI
import UIKit


/*
struct IndianFlagSmokeView: UIViewRepresentable {
    var particleColor: UIColor
    
    init(particleColor: UIColor) {
        self.particleColor = particleColor
    }
    
    func makeUIView(context: Context) -> UIView {
        let smokeView = UIView()
        
        let emitterLayer = CAEmitterLayer()
        emitterLayer.emitterPosition = CGPoint(x: smokeView.bounds.size.width / 2, y: 0)
        emitterLayer.emitterSize = CGSize(width: smokeView.bounds.size.width, height: 1)
        emitterLayer.emitterShape = .line
        emitterLayer.emitterCells = [createSmokeParticleCell()]
        
        smokeView.layer.addSublayer(emitterLayer)
        
        return smokeView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
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

*/

import SwiftUI

public struct IndianFlagSmokeView: UIViewRepresentable {
    var particleColor: UIColor
    
    public init(particleColor: UIColor) {
        self.particleColor = particleColor
    }
    
    public func makeUIView(context: Context) -> UIView {
        let smokeView = UIView()
        
        let emitterLayer = CAEmitterLayer()
        emitterLayer.emitterPosition = CGPoint(x: smokeView.bounds.size.width / 2, y: 0)
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

