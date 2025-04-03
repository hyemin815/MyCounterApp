//
//  Calculate.swift
//  MyCounterApp
//
//  Created by 박혜민 on 4/3/25.
//

import Foundation

struct Calculator {
    static func calculate(expression: String) -> Int? {
        let expression = NSExpression(format: expression)
        return expression.expressionValue(with: nil, context: nil) as? Int
    }
}
