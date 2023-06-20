//
//  TutorialInteractor.swift
//  AssemblerDemo
//

import Foundation

// MARK: - BUSINESS LOGIC
protocol TutorialInteractorProtocol {
	func generateUniqueString(request: TutorialModel.GenerateUniqueString.Request)
}

// MARK: - INTERACTOR
class TutorialInteractor: TutorialInteractorProtocol {
	var presenter: TutorialPresenterProtocol?
	var worker: TutorialWorkerProtocol?
	
	var dataProcessingService: DataProcessingServiceProtocol?
	
	init(
		presenter: TutorialPresenterProtocol?,
		worker: TutorialWorkerProtocol?,
		dataProcessingService: DataProcessingServiceProtocol?
	) {
		self.presenter = presenter
		self.worker = worker
		self.dataProcessingService = dataProcessingService
	}
}

// MARK: - DO SOMETHING
extension TutorialInteractor {
	func generateUniqueString(request: TutorialModel.GenerateUniqueString.Request) {
		let uniqueString = (try? dataProcessingService?.generateUniqueString(
			prefix: ">",
			suffix: "<"
		)) ?? "Unknown"
		
		let response = TutorialModel.GenerateUniqueString.Response(uniqueString: uniqueString)
		presenter?.presentGeneratedUniqueString(response: response)
	}
}
