//
//  TutorialViewController.swift
//  AssemblerDemo
//

import Foundation
import SwiftUI
import UIKit

// MARK: - DISPLAY LOGIC
protocol TutorialViewControllerProtocol: AnyObject {
	func displayGeneratedUniqueString(viewModel: TutorialModel.GenerateUniqueString.ViewModel)
}

// MARK: - VIEW CONTROLLER
class TutorialViewController: TutorialViewControllerProtocol, ObservableObject {
	weak var hostingController: UIHostingController<TutorialView>?
	var interactor: TutorialInteractorProtocol?
	var router: TutorialRouterProtocol?
	
	@Published var viewModel = TutorialViewModel()
	
	func onAppear() {
		initTutorialViewController()
	}
}

// MARK: - DO SOMETHING
extension TutorialViewController {
	func generateUniqueString() {
		let request = TutorialModel.GenerateUniqueString.Request()
		interactor?.generateUniqueString(request: request)
	}
	
	func displayGeneratedUniqueString(viewModel: TutorialModel.GenerateUniqueString.ViewModel) {
		self.viewModel.title = viewModel.uniqueString
	}
}

// MARK: - PRIVATE EXTENSIONS
private extension TutorialViewController {
	// MARK: INIT
	func initTutorialViewController() {
		generateUniqueString()
	}
}
