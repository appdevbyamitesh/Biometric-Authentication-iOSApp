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
        context.touchIDAuthenticationAllowableReuseDuration = LATouchIDAuthenticationMaximumAllowableReuseDuration
        evaluatePolicy()
    }
    
    func evaluatePolicy() {
        var errorCanEval: NSError?
        //  deviceOwnerAuthenticationWithBiometrics and deviceOwnerAuthentication are policies used for authenticating the device owner. They are part of the Local Authentication framework, which provides mechanisms for evaluating authentication policies and managing credentials
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &errorCanEval) {
            switch context.biometryType {
            case .faceID:
                debugPrint("face ID")
            case .touchID:
                debugPrint("touch ID")
            case .opticID:
                debugPrint("optic ID")
            case .none:
                debugPrint("None")
            @unknown default:
                debugPrint("unknown")
            }
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "Fallback title: override reason") { (success, error) in
                debugPrint("\(success)")
                if let err = error {
                    let evalErrCode = LAError(_nsError: err as NSError)
                    switch evalErrCode.code {
                    case LAError.Code.userCancel:
                        debugPrint("User cancelled")
                    case LAError.Code.appCancel:
                        debugPrint("App cancelled")
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
            if let err = errorCanEval {
                let evalErrCode = LAError(_nsError: err as NSError)
                switch evalErrCode.code {
                case LAError.Code.biometryNotAvailable:
                    debugPrint("Not enrolled")
                default:
                    debugPrint("Other Error")
                }
            }
        }
        
    }
    
    
}

