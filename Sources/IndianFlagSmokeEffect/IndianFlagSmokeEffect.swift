
import SwiftUI
import UIKit

// IndianFlagSmokeEffect.swift

import SwiftUI
import UIKit

@objc public class IndianFlagSmokeEffect: NSObject {
    @objc public static func presentSmokeEffect(from viewController: UIViewController) {
        SmokeEffectPresenter.presentSmokeEffect(from: viewController)
    }
}


#if DEBUG
struct IndianFlagSmokeView_Previews: PreviewProvider {
    static var previews: some View {
//        Group {
            IndianFlagSmokeView(particleColor: .orange)
                .previewDisplayName("Saffron Smoke")
                .frame(width: 100, height: 400)
                .position(x:50, y:100)
//                .background(Color.black)
            
            IndianFlagSmokeView(particleColor: .blue)
                .previewDisplayName("White Smoke")
                .position(x:50, y:200)
                .frame(width: 100, height: 400)
//                .background(Color.black)
            
            IndianFlagSmokeView(particleColor: .green)
                .previewDisplayName("Green Smoke")
                .position(x:100, y:300)

                .frame(width: 100, height: 400)
//                .background(Color.black)
//        }
    }
}
#endif
