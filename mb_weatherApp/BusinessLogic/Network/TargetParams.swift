//
//  TargetParams.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 09/07/2023.
//

import Moya

// MARK: - TargetParamsProtocol

protocol TargetParamsProtocol {
    var path: String { get }
    var method: Moya.Method { get }
    var task: Task { get }
    var headers: [String: String] { get }
    var sampleData: Data { get }
}

// MARK: - TargetParams

struct TargetParams: TargetParamsProtocol {
    // MARK: Lifecycle

    init(path: String, method: Moya.Method, task: Task, headers: [String: String] = [:], sampleData: Data = Data()) {
        self.path = path
        self.method = method
        self.task = task
        self.headers = headers
        self.sampleData = sampleData
    }

    // MARK: Internal

    let path: String
    let method: Moya.Method
    let task: Task
    let headers: [String: String]
    let sampleData: Data
}
