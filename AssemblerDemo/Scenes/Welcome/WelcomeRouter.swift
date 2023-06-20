//
//  WelcomeRouter.swift
//  AssemblerDemo
//

import Foundation
import KyuGenericExtensions
import UIKit

// MARK: - ROUTING LOGIC
protocol WelcomeRouterProtocol {
	func navigateToTutorialView()
}

// MARK: - ROUTER
struct WelcomeRouter: WelcomeRouterProtocol {
	let transitionCoordinator: TransitionCoordinatorProtocol
	
	func navigateToTutorialView() {
		transitionCoordinator.performNavigation(
			NavigationType.present(
				sceneName: TutorialSceneModule.moduleName,
				parameters: nil
			),
			animated: true,
			completion: nil
		)
	}
}
