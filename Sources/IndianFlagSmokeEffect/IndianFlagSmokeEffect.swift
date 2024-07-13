
import SwiftUI
import UIKit

// IndianFlagSmokeEffect.swift

import SwiftUI
import UIKit

public struct IndianFlagSmokeEffect {
    public static func presentSmokeEffect(from viewController: UIViewController) {
        SmokeEffectPresenter.presentSmokeEffect(from: viewController)
    }
}


#if DEBUG
struct IndianFlagSmokeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            IndianFlagSmokeView(particleColor: .orange)
                .previewDisplayName("Saffron Smoke")
                .frame(width: 100, height: 400)
//                .background(Color.black)
            
            IndianFlagSmokeView(particleColor: .white)
                .previewDisplayName("White Smoke")
                .frame(width: 100, height: 400)
//                .background(Color.black)
            
            IndianFlagSmokeView(particleColor: .green)
                .previewDisplayName("Green Smoke")
                .frame(width: 100, height: 400)
//                .background(Color.black)
        }
    }
}
#endif
