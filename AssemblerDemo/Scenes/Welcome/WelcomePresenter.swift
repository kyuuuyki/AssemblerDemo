//
//  WelcomePresenter.swift
//  AssemblerDemo
//

import Foundation
import UIKit

// MARK: - PRESENTATION LOGIC
protocol WelcomePresenterProtocol {
	func presentSomething(response: WelcomeModel.Something.Response)
}

// MARK: - PRESENTER
struct WelcomePresenter: WelcomePresenterProtocol {
	weak var viewController: WelcomeViewControllerProtocol?
}

// MARK: - DO SOMETHING
extension WelcomePresenter {
	func presentSomething(response: WelcomeModel.Something.Response) {
		let viewModel = WelcomeModel.Something.ViewModel()
		viewController?.displaySomething(viewModel: viewModel)
	}
}
