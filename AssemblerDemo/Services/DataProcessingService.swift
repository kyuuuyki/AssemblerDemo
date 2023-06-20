//
//  DataProcessingService.swift
//  AssemblerDemo
//

import Foundation
import KyuGenericExtensions

public protocol DataProcessingServiceProtocol: ModuleProtocol {
	func generateUniqueString(prefix: String, suffix: String) throws -> String
}

struct DataProcessingService: DataProcessingServiceProtocol {
	enum ServiceError: Error {
		case invalidData
	}
	
	static var moduleName: String = "AssemblerDemo.DataProcessingService"
	
	func generateUniqueString(prefix: String, suffix: String) throws -> String {
		guard !prefix.isEmpty && !suffix.isEmpty else {
			throw ServiceError.invalidData
		}
		
		return prefix + UUID().uuidString + suffix
	}
}

struct TestStruct {
	let dataProcessingService = DataProcessingService()
	
	var uniqueString: String? {
		try? dataProcessingService.generateUniqueString(prefix: "Prefix", suffix: "Suffix")
	}
}
