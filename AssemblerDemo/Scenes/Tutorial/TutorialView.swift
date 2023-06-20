//
//  TutorialView.swift
//  AssemblerDemo
//

import SwiftUI
import UIKit

// MARK: - VIEW
struct TutorialView: View {
	@ObservedObject var viewController: TutorialViewController
	
	var body: some View {
		let viewModel = $viewController.viewModel
		
		Text(viewModel.title.wrappedValue)
			.onAppear { [weak viewController] in
				viewController?.onAppear()
			}
	}
}

// MARK: - PREVIEW
struct TutorialView_Previews: PreviewProvider {
	static var previews: some View {
		let viewController = TutorialViewController()
		let viewModel = TutorialViewModel(
			title: "TutorialView"
		)
		viewController.viewModel = viewModel
		return TutorialView(viewController: viewController)
	}
}

// MARK: - VIEW MODEL
struct TutorialViewModel {
	var title: String = ""
}
