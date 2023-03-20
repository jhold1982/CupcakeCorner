//
//  String-EmptyChecking.swift
//  CupcakeCorner
//
//  Created by Justin Hold on 10/7/22.
//

import Foundation

extension String {
    var isReallyEmpty: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
