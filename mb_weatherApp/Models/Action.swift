//
//  Action.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 08/07/2023.
//

import Foundation

struct Action<T> {
    // MARK: Lifecycle

    init(action: @escaping (T) -> ()) {
        self.action = action
    }

    // MARK: Internal

    func perform(param: T) {
        action(param)
    }

    // MARK: Private

    private let action: (T) -> ()
}
