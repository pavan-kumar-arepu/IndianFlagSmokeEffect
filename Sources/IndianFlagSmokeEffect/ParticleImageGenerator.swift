//
//  File.swift
//  
//
//  Created by Pavankumar Arepu on 13/07/24.
//  ParticleImageGenerator.swift

import Foundation
import UIKit

class ParticleImageGenerator {
    static func generateParticleImage(size: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        
        let image = renderer.image { context in
            let particleColor = UIColor(white: 1.0, alpha: 0.5)
            context.cgContext.setFillColor(particleColor.cgColor)
            context.cgContext.fillEllipse(in: CGRect(origin: .zero, size: size))
        }
        
        return image
    }
}
