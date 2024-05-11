//
//  ViewController.swift
//  BioAuth-iOS
//
//  Created by Amitesh Mani Tiwari on 02/04/24.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    var context = LAContext()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        context.localizedCancelTitle = "Logout App"
        context.localizedFallbackTitle = "Use passcode (2)"
        context.localizedReason = "This app needs your authentication."
        evaluatePolicy()
    }
    
    func evaluatePolicy() {
        var errorCanEval: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &errorCanEval) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Fallback title: override reason") { (success, error) in
                debugPrint("\(success)")
                if let err = error {
                    let evalErrCode = LAError(_nsError: err as NSError)
                    switch evalErrCode.code {
                    case LAError.Code.userCancel:
                        debugPrint("User cancelled")
                    case LAError.Code.userFallback:
                        debugPrint("Fallback")
                    case LAError.Code.authenticationFailed:
                        debugPrint("Failed")
                    default:
                        debugPrint("Other Error")
                    }
                }
            }
        } else {
            debugPrint("can't evaluate")
            debugPrint(errorCanEval?.localizedDescription ?? "no error desc")
        }
        
    }
    
    
}

