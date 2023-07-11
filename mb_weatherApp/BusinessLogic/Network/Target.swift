//
//  Target.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 09/07/2023.
//

import Moya

// MARK: - Target

protocol Target: TargetType {
    associatedtype TargetParams: TargetParamsProtocol

    var params: TargetParams { get }
}

extension Target {
    var baseURL: URL {
        if let url = Constants.API.baseURL {
            return url
        }
        assertionFailure("Invalid base URL")
        return URL(fileURLWithPath: "")
    }

    var path: String {
        return params.path
    }

    var method: Moya.Method {
        return params.method
    }

    var task: Task {
        return params.task
    }

    var headers: [String: String]? {
        return nil
    }
    
    var sampleData: Data {
        return params.sampleData
    }
}
