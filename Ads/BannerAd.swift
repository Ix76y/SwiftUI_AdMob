//
//  BannerAd.swift
//  AdMobExampleApp
//
//  Created by Iz on 08/10/2021.
//

import Foundation
import SwiftUI
import GoogleMobileAds
import UIKit

final class BannerAd: UIViewControllerRepresentable  {
    static var bannerHeight: CGFloat = 80.0
    private let bannerId = "ca-app-pub-3940256099942544/2934735716" // TODO: replace this with your own Ad ID

    func makeUIViewController(context: Context) -> UIViewController {
        let bannerView = GADBannerView(adSize: kGADAdSizeBanner)

        let viewController = UIViewController()
        bannerView.adUnitID = bannerId
        bannerView.rootViewController = viewController
        viewController.view.addSubview(bannerView)
        
        let frame = viewController.view.frame.inset(by: viewController.view.safeAreaInsets)
        let viewWidth = frame.size.width

        bannerView.adSize = GADCurrentOrientationAnchoredAdaptiveBannerAdSizeWithWidth(viewWidth)
        viewController.view.frame = CGRect(origin: .zero, size: bannerView.adSize.size)
        BannerAd.bannerHeight = bannerView.adSize.size.height
        
        bannerView.load(GADRequest())

        return viewController
    }
    

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
