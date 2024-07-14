# IndianFlagSmokeEffect

`IndianFlagSmokeEffect` is a Swift package that provides a visual effect of smoke in the colors of the Indian flag. This effect can be used in iOS applications to create a unique visual experience.

## Features

- Generate smoke in saffron, white, and green colors.
- Display the smoke effect in a modal view.
- Easy integration with SwiftUI and UIKit.

## Animation Video 

https://github.com/user-attachments/assets/68dde4cc-b957-450b-943c-082994788529

## Screenshots 

![Client App Animation Triggering Screen ](https://github.com/user-attachments/assets/dd34ae10-8fa4-432b-9977-9a48295c7364)

![Swift Pacakge Animation Screenscreenshot](https://github.com/user-attachments/assets/6e7f8e1b-48b2-4e12-8eb8-d67949247dfc)


## Installation

### Swift Package Manager

You can add `IndianFlagSmokeEffect` to your project using Swift Package Manager. 

1. In Xcode, select `File > Add Packages...`
2. Enter the URL of the package repository: `https://github.com/your-username/IndianFlagSmokeEffect`
3. Choose the version and add the package to your project.

Alternatively, you can add the following dependency to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/your-username/IndianFlagSmokeEffect", from: "1.0.0")
]

Usage
SwiftUI
To use IndianFlagSmokeEffect in a SwiftUI view, follow these steps:


import SwiftUI
import IndianFlagSmokeEffect

struct ContentView: View {
    @Environment(\.rootViewController) private var rootViewController
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Your App Content")
                    .foregroundColor(.white)
                    .padding()
                
                Button(action: {
                    if let rootViewController = rootViewController {
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

## UIKit
To use IndianFlagSmokeEffect in a UIKit view controller, follow these steps:


import UIKit
import IndianFlagSmokeEffect

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(type: .system)
        button.setTitle("Show Smoke Effect", for: .normal)
        button.addTarget(self, action: #selector(showSmokeEffect), for: .touchUpInside)
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        view.addSubview(button)
    }
    
    @objc func showSmokeEffect() {
        SmokeEffectPresenter.presentSmokeEffect(from: self)
    }
}

RootViewControllerAccessor
To access the root view controller in SwiftUI, use the RootViewControllerAccessor provided by the package. This allows you to present the smoke effect modally from a SwiftUI view.

import SwiftUI
import UIKit

public struct RootViewControllerKey: EnvironmentKey {
    public static var defaultValue: UIViewController? {
        return UIApplication.shared.windows.first?.rootViewController
    }
}

public extension EnvironmentValues {
    var rootViewController: UIViewController? {
        get { self[RootViewControllerKey.self] }
        set { self[RootViewControllerKey.self] = newValue }
    }
}

public struct RootViewControllerAccessor: UIViewControllerRepresentable {
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

## Example Project
An example project is included in the package to demonstrate how to use the smoke effect in both SwiftUI and UIKit.

## Contributing
Contributions are welcome! Please open an issue or submit a pull request with your changes.

