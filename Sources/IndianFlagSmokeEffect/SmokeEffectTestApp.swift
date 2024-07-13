//
//  File.swift
//  
//
//  Created by Pavankumar Arepu on 13/07/24.
//

import Foundation
import SwiftUI


@available(iOS 14.0, *)
@main
struct SmokeEffectTestApp: App {
    @available(iOS 14.0, *)
    var body: some Scene {
        WindowGroup {
            TestContentView()
        }
    }
}

struct TestContentView: View {
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Smoke Effect Test")
                    .foregroundColor(.white)
                    .padding()
                
                Button(action: {
                    if let rootViewController = UIApplication.shared.windows.first?.rootViewController {
                        SmokeEffectPresenter.presentSmokeEffect(from: rootViewController)
                    }
                }) {
                    Text("Show Smoke Effect")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
            }
        }
        .background(RootViewControllerAccessor().hidden())
    }
}
