//
//  WelcomeSceneModule.swift
//  AssemblerDemo
//

import Foundation
import KyuGenericExtensions
import SwiftUI
import UIKit

// MARK: - SCENE MODULE
public struct WelcomeSceneModule: SceneModuleProtocol {
	public static var moduleName: String = "AssemblerDemo.WelcomeSceneModule"
	
	public func build(resolver: ResolverProtocol, parameters: [String: Any]?) -> UIViewController? {
		// Services
		guard let transitionCoordinator = resolver.resolve(
			TransitionCoordinatorProtocol.self,
			name: "AssemblerDemo.TransitionCoordinator"
		) else {
			return nil
		}
		
		// ViewController
		let viewController = WelcomeViewController()
		
		let worker = WelcomeWorker()
		let presenter = WelcomePresenter(viewController: viewController)
		let interactor = WelcomeInteractor(presenter: presenter, worker: worker)
		let router = WelcomeRouter(transitionCoordinator: transitionCoordinator)
		viewController.interactor = interactor
		viewController.router = router
		
		let view = WelcomeView(viewController: viewController)
		let hostingController = UIHostingController(rootView: view)
		viewController.hostingController = hostingController
		return hostingController
	}
}
