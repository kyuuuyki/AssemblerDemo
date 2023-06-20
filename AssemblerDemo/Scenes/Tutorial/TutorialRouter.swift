//
//  TutorialRouter.swift
//  AssemblerDemo
//

import Foundation
import KyuGenericExtensions
import UIKit

// MARK: - ROUTING LOGIC
protocol TutorialRouterProtocol {
}

// MARK: - ROUTER
struct TutorialRouter: TutorialRouterProtocol {
	let transitionCoordinator: TransitionCoordinatorProtocol
}
