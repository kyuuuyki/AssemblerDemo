//
//  Assembler.swift
//  AssemblerDemo
//

import Foundation
import KyuGenericExtensions
import SwiftUI

public final class Assembler: AssemblerProtocol {
	// MARK: PUBLIC
	public static func assembler() -> AssemblerProtocol {
		return self.shared
	}
	
	public let container: ContainerProtocol = Container()
	
	// MARK: PRIVATE
	private init() {}
	private static let shared = Assembler()
}

public extension Assembler {
	func configure(window: UIWindow?) {
		configureModules()
		configureRootViewController(window: window)
	}
	
	func configureModules() {
		container.register(
			TransitionCoordinatorProtocol.self,
			name: TransitionCoordinator.moduleName
		) { _ in
			return TransitionCoordinator()
		}
		
		container.register(
			SceneModuleProtocol.self,
			name: WelcomeSceneModule.moduleName
		) { _ in
			return WelcomeSceneModule()
		}
		
		container.register(
			SceneModuleProtocol.self,
			name: TutorialSceneModule.moduleName
		) { _ in
			return TutorialSceneModule()
		}
		
		container.register(
			DataProcessingServiceProtocol.self,
			name: DataProcessingService.moduleName
		) { _ in
			return DataProcessingService()
		}
	}
	
	func configureRootViewController(window: UIWindow?) {
		guard let viewController = resolver.resolve(
			SceneModuleProtocol.self,
			name: WelcomeSceneModule.moduleName
		)?.build(resolver: resolver, parameters: nil)
		else {
			return
		}
		window?.rootViewController = viewController
	}
}
