import React
import ReactAppDependencyProvider
import UIKit
import Expo

class ReactNativeViewController: UIViewController {
  var reactNativeDelegate: ExpoReactNativeFactoryDelegate?
  var reactNativeFactory: RCTReactNativeFactory?

	override func viewDidLoad() {
		super.viewDidLoad()

		let delegate = ReactNativeDelegate()
		let factory = RCTReactNativeFactory(delegate: delegate)
		delegate.dependencyProvider = RCTAppDependencyProvider()

		reactNativeDelegate = delegate
		reactNativeFactory = factory
		let rootView = factory.rootViewFactory.view(withModuleName: "main")
		delegate.setRootView(rootView, toRootViewController: self)
	}
}

class ReactNativeDelegate: ExpoReactNativeFactoryDelegate {
  override func sourceURL(for bridge: RCTBridge) -> URL? {
    bridge.bundleURL ?? bundleURL()
  }

  override func bundleURL() -> URL? {
#if DEBUG
    return RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: ".expo/.virtual-metro-entry")
#else
    return Bundle.main.url(forResource: "main", withExtension: "jsbundle")
#endif
  }
}
