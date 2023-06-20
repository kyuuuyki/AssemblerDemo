//
//  WelcomeInteractor.swift
//  AssemblerDemo
//

import Foundation

// MARK: - BUSINESS LOGIC
protocol WelcomeInteractorProtocol {
	func doSomething(request: WelcomeModel.Something.Request)
}

// MARK: - INTERACTOR
class WelcomeInteractor: WelcomeInteractorProtocol {
	var presenter: WelcomePresenterProtocol?
	var worker: WelcomeWorkerProtocol?
	
	init(
		presenter: WelcomePresenterProtocol?,
		worker: WelcomeWorkerProtocol?
	) {
		self.presenter = presenter
		self.worker = worker
	}
}

// MARK: - DO SOMETHING
extension WelcomeInteractor {
	func doSomething(request: WelcomeModel.Something.Request) {
		worker?.doSomeWork()
		
		let response = WelcomeModel.Something.Response()
		presenter?.presentSomething(response: response)
	}
}
