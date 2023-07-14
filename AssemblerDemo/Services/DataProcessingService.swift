//
//  DataProcessingService.swift
//  AssemblerDemo
//

import Foundation
import KyuGenericExtensions

public protocol DataProcessingServiceProtocol: ModuleProtocol {
	/// Generate a unique string prefixed and suffixed by specified strings.
	///
	/// Generate a unique string using [UUID().uuidString](https://developer.apple.com/documentation/foundation/uuid/1779712-uuidstring) then prefixs and suffixs it by specified strings.
	///
	/// ```swift
	/// let dataProcessingService = DataProcessingService()
	/// let uniqueString = try? dataProcessingService.generateUniqueString(
	/// 	prefix: "Prefix",
	/// 	suffix: "Suffix"
	/// )
	/// ```
	///
	/// - Parameters:
	/// 	- prefix: User-specified prefix string.
	/// 	- suffix: User-specified suffix string.
	///
	/// - Returns: A uniquely generated string encased with specified prefix and suffix strings.
	///
	/// - Throws: Throws an error if the specified prefix or suffix is empty.
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
