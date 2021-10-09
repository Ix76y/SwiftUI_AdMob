//
//  RewardedAd.swift
//  AdMobExampleApp
//
//  Created by Iz on 07/10/2021.
//

import Foundation
import GoogleMobileAds
import SwiftUI
import UIKit

final class RewardedAd {
    private let rewardId = "ca-app-pub-3940256099942544/1712485313" // TODO: replace this with your own Ad ID
    
    var rewardedAd: GADRewardedAd?
    
    init() {
        load()
    }
    
    func load(){
        GADRewardedAd.load(withAdUnitID: rewardId, request: GADRequest(), completionHandler: {rewardedAd, error in
            if error != nil {
                return
            }
            self.rewardedAd = rewardedAd
        })
    }
    
    func showAd(rewardFunction: @escaping () -> Void) -> Bool {
        guard let rewardedAd = rewardedAd, let root = UIApplication.shared.keyWindowPresentedController else {
            return false
        }
        
        rewardedAd.present(fromRootViewController: root, userDidEarnRewardHandler: rewardFunction)
        return true
    }
}

extension UIApplication {
    
    var keyWindow: UIWindow? {
        return UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .first(where: { $0 is UIWindowScene })
            .flatMap({ $0 as? UIWindowScene })?.windows
            .first(where: \.isKeyWindow)
    }
    
    var keyWindowPresentedController: UIViewController? {
        var viewController = self.keyWindow?.rootViewController
        
        if let presentedController = viewController as? UITabBarController {
            viewController = presentedController.selectedViewController
        }
        
        while let presentedController = viewController?.presentedViewController {
            if let presentedController = presentedController as? UITabBarController {
                viewController = presentedController.selectedViewController
            } else {
                viewController = presentedController
            }
        }
        return viewController
    }
}

