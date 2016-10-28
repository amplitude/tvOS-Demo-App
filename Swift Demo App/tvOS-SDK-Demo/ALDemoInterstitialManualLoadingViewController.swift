//
//  ALDemoInterstitialManualLoadingViewController.swift
//  tvOS-SDK-Demo
//
//  Created by Thomas So on 11/13/15.
//  Copyright © 2015 AppLovin. All rights reserved.
//

import UIKit

class ALDemoInterstitialManualLoadingViewController: ALDemoBaseViewController, ALAdLoadDelegate, ALAdDisplayDelegate, ALAdVideoPlaybackDelegate
{
    var ad: ALAd?
    
    @IBAction func loadInterstitial(_ sender: AnyObject!)
    {
        self.log("Interstitial loading...")
        ALSdk.shared()!.adService.loadNextAd(ALAdSize.sizeInterstitial(), andNotify: self)
    }
    
    @IBAction func showInterstitial(_ sender: AnyObject!)
    {
        // Optional: Assign delegates
        ALInterstitialAd.shared().adDisplayDelegate = self
        ALInterstitialAd.shared().adVideoPlaybackDelegate = self
        
        if let ad = self.ad
        {
            ALInterstitialAd.shared().showOver(UIApplication.shared.keyWindow!, andRender: ad)
        }
    }
    
    // MARK: Ad Load Delegate
    
    func adService(_ adService: ALAdService, didLoad ad: ALAd)
    {
        self.log("Interstitial Loaded")
        
        self.ad = ad
        self.showButton.isEnabled = true
        self.requestedFocusView = self.showButton
    }
    
    func adService(_ adService: ALAdService, didFailToLoadAdWithError code: Int32)
    {
        // Look at ALErrorCodes.h for list of error codes
        self.log("Interstitial failed to load with error code \(code)")
    }
    
    // MARK: Ad Display Delegate
    
    func ad(_ ad: ALAd, wasDisplayedIn view: UIView)
    {
        self.log("Interstitial Displayed")
    }
    
    func ad(_ ad: ALAd, wasHiddenIn view: UIView)
    {
        self.log("Interstitial Dismissed")
    }
    
    func ad(_ ad: ALAd, wasClickedIn view: UIView)
    {
        self.log("Interstitial Clicked")
    }
    
    // MARK: Ad Video Playback Delegate
    
    func videoPlaybackBegan(in ad: ALAd)
    {
        self.log("Video Started")
    }
    
    func videoPlaybackEnded(in ad: ALAd, atPlaybackPercent percentPlayed: NSNumber, fullyWatched wasFullyWatched: Bool)
    {
        self.log("Video Ended")
    }
}
