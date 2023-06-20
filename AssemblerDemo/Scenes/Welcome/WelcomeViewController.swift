//
//  WelcomeViewController.swift
//  AssemblerDemo
//

import Foundation
import SwiftUI
import UIKit

// MARK: - DISPLAY LOGIC
protocol WelcomeViewControllerProtocol: AnyObject {
	func displaySomething(viewModel: WelcomeModel.Something.ViewModel)
}

// MARK: - VIEW CONTROLLER
class WelcomeViewController: WelcomeViewControllerProtocol, ObservableObject {
	weak var hostingController: UIHostingController<WelcomeView>?
	var interactor: WelcomeInteractorProtocol?
	var router: WelcomeRouterProtocol?
	
	@Published var viewModel = WelcomeViewModel()
	
	func onAppear() {
		initWelcomeViewController()
	}
	
	func didTapOnTutorialButton() {
		router?.navigateToTutorialView()
	}
}

// MARK: - DO SOMETHING
extension WelcomeViewController {
	func doSomething() {
		let request = WelcomeModel.Something.Request()
		interactor?.doSomething(request: request)
	}
	
	func displaySomething(viewModel: WelcomeModel.Something.ViewModel) {
		self.viewModel.title = "WelcomeViewController"
	}
}

// MARK: - PRIVATE EXTENSIONS
private extension WelcomeViewController {
	// MARK: INIT
	func initWelcomeViewController() {
		doSomething()
	}
}
