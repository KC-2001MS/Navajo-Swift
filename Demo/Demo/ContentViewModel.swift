//
//  ContentViewModel.swift
//  Demo
//
//  Created by 茅根啓介 on 2024/12/09.
//

import Observation
import Navajo_Swift
import Foundation

@Observable
final class ContentViewModel {
    private let standardValidator = PasswordValidator.standard
    private let customValidator: PasswordValidator = {
        let lengthRule = LengthRule(min: 2, max: 4)
        let emailRegularExpression = try! NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}", options: [])
        let emailFilteringRule = RegularExpressionRule(regularExpression: emailRegularExpression)
        return PasswordValidator(rules: [lengthRule, emailFilteringRule])
    }()
    
    var password: String = "" {
        didSet {
            validatePassword()
        }
    }
    
    var useCustomValidator: Bool = false {
        didSet {
            validatePassword()
        }
    }
    
    var validator: PasswordValidator {
        useCustomValidator ? customValidator : standardValidator
    }
    
    var strength: String = ""
    var validation: String = ""
    
    init() {
        self.password = ""
        self.useCustomValidator = false
        self.strength = ""
        self.validation = ""
    }
    
    private func validatePassword() {
        let strengthLevel = Navajo.strength(ofPassword: password)
        strength = Navajo.localizedString(forStrength: strengthLevel)

        if let failingRules = validator.validate(password) {
            validation = failingRules.map { $0.localizedErrorDescription }.joined(separator: "\n")
        } else {
            validation = ""
        }
    }
}
