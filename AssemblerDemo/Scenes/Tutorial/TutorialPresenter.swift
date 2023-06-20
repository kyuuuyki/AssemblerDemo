//
//  TutorialPresenter.swift
//  AssemblerDemo
//

import Foundation
import UIKit

// MARK: - PRESENTATION LOGIC
protocol TutorialPresenterProtocol {
	func presentGeneratedUniqueString(response: TutorialModel.GenerateUniqueString.Response)
}

// MARK: - PRESENTER
struct TutorialPresenter: TutorialPresenterProtocol {
	weak var viewController: TutorialViewControllerProtocol?
}

// MARK: - DO SOMETHING
extension TutorialPresenter {
	func presentGeneratedUniqueString(response: TutorialModel.GenerateUniqueString.Response) {
		let uniqueString = response.uniqueString
		let viewModel = TutorialModel.GenerateUniqueString.ViewModel(uniqueString: uniqueString)
		viewController?.displayGeneratedUniqueString(viewModel: viewModel)
	}
}
