
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

public class SmokeModalViewController: UIViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        
        let saffronHostingController = UIHostingController(rootView: IndianFlagSmokeView(particleColor: .orange))
        let whiteHostingController = UIHostingController(rootView: IndianFlagSmokeView(particleColor: .white))
        let greenHostingController = UIHostingController(rootView: IndianFlagSmokeView(particleColor: .green))
        
        addChild(saffronHostingController)
        addChild(whiteHostingController)
        addChild(greenHostingController)
        
        view.addSubview(saffronHostingController.view)
        view.addSubview(whiteHostingController.view)
        view.addSubview(greenHostingController.view)
        
        saffronHostingController.didMove(toParent: self)
        whiteHostingController.didMove(toParent: self)
        greenHostingController.didMove(toParent: self)
        
        saffronHostingController.view.frame = view.bounds
        whiteHostingController.view.frame = view.bounds
        greenHostingController.view.frame = view.bounds
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.dismiss(animated: true, completion: nil)
        }
    }
}

public class SmokeEffectPresenter {
    public static func presentSmokeEffect(from viewController: UIViewController) {
        let smokeModalViewController = SmokeModalViewController()
        smokeModalViewController.modalPresentationStyle = .overFullScreen
        viewController.present(smokeModalViewController, animated: true, completion: nil)
    }
}
