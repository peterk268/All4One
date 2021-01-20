//
//  ContentView.swift
//  All4One
//
//  Created by Peter Khouly on 13/10/2019.
//  Copyright © 2019 Peter Khouly. All rights reserved.
//


import SwiftUI
import WebKit
import Firebase
import UIKit


struct WebViewY : UIViewRepresentable {
    let url = URL (string: "https://www.youtube.com?playsinline=1")
    func makeUIView(context: Context) -> WKWebView  {
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.allowsInlineMediaPlayback = true
        webConfiguration.allowsAirPlayForMediaPlayback = true

        return WKWebView(frame: .zero, configuration: webConfiguration)
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let req = URLRequest(url: url!)
        uiView.load(req)
    }
}


struct WebViewG : UIViewRepresentable {
    let url = URL (string: "https://www.google.com")
    func makeUIView(context: Context) -> WKWebView  {
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.allowsInlineMediaPlayback = true
        webConfiguration.allowsAirPlayForMediaPlayback = true
        
        return WKWebView(frame: .zero, configuration: webConfiguration)
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let req = URLRequest(url: url!)
        uiView.load(req)
    }
}


struct WebViewI : UIViewRepresentable {
    let url = URL (string: "https://www.instagram.com")
    func makeUIView(context: Context) -> WKWebView  {
       let webConfiguration = WKWebViewConfiguration()
        webConfiguration.allowsInlineMediaPlayback = true
        webConfiguration.allowsAirPlayForMediaPlayback = true

        return WKWebView(frame: .zero, configuration: webConfiguration)
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let req = URLRequest(url: url!)
        uiView.load(req)
    }
}

struct GADBannerViewController: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let view = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
        let viewController = UIViewController()
        view.adUnitID = "ca-app-pub-3940256099942544/2934735716" //"ca-app-pub-2327919202865605/8818874660"
        view.rootViewController = viewController
        viewController.view.addSubview(view)
        viewController.view.frame = CGRect(origin: .zero, size: kGADAdSizeSmartBannerPortrait.size)
        view.load(GADRequest())
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}


struct ContentView : View {
    var url: URL
    var body: some View {
        
        VStack {
            HStack{
                WebViewG()
                
                WebViewI()
            }
            NavigationLink(destination: SettingsView()){
            HStack(){
                Text("Settings")
                    .fontWeight(.thin)
                    .font(Font.custom("Helvetica Neue", size: 14))
                    .foregroundColor(Color ("colorset"))
                
                }}.padding(.top, -11)
            HStack(){
           WebViewY()
            }.padding(.top, -11)
            
            HStack{
                GADBannerViewController()
                    .frame(height: 50)
            }.padding(.trailing, 0)
                .padding(.leading, 0)
        }
    .navigationBarTitle("")
        .navigationBarHidden(true)
    .navigationBarBackButtonHidden(true)
        
    }
}


/// Tells the delegate an ad request loaded an ad.
func adViewDidReceiveAd(_ bannerView: GADBannerView) {
  print("adViewDidReceiveAd")
}

/// Tells the delegate an ad request failed.
func adView(_ bannerView: GADBannerView,
    didFailToReceiveAdWithError error: GADRequestError) {
  print("adView:didFailToReceiveAdWithError: \(error.localizedDescription)")
}

/// Tells the delegate that a full-screen view will be presented in response
/// to the user clicking on an ad.
func adViewWillPresentScreen(_ bannerView: GADBannerView) {
  print("adViewWillPresentScreen")
}

/// Tells the delegate that the full-screen view will be dismissed.
func adViewWillDismissScreen(_ bannerView: GADBannerView) {
  print("adViewWillDismissScreen")
}

/// Tells the delegate that the full-screen view has been dismissed.
func adViewDidDismissScreen(_ bannerView: GADBannerView) {
  print("adViewDidDismissScreen")
}

/// Tells the delegate that a user click will open another app (such as
/// the App Store), backgrounding the current app.
func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
  print("adViewWillLeaveApplication")
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(url: URL(string: "https://www.youtube.com")!)
    }
}
