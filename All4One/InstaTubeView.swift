//
//  InstaTubeView.swift
//  All4One
//
//  Created by Peter Khouly on 03/11/2019.
//  Copyright © 2019 Peter Khouly. All rights reserved.
//

import SwiftUI
import WebKit
import Firebase

/*struct WebViewY1 : UIViewRepresentable {
    let url = URL (string: "https://www.youtube.com")
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView(frame: .zero)
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let req = URLRequest(url: url!)
        uiView.load(req)
    }
}

struct WebViewI1 : UIViewRepresentable {
    let url = URL (string: "https://www.instagram.com")
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView(frame: .zero)
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let req = URLRequest(url: url!)
        uiView.load(req)
    }
}*/


struct InstaTubeView: View {
     var url: URL
      @State var allowsInlineMediaPlayback: Bool = true
      @State var allowsAirPlayForMediaPlayback: Bool = true
      @State var allowsPictureInPictureMediaPlayback: Bool = true
      @State var allowsBackForwardNavigationGestures: Bool = true
       var body: some View {
           
           VStack {
               HStack{
                WebViewI()
               }
               NavigationLink(destination: SettingsView()){
               HStack(){
                   Text("Settings")
                      // .font(.footnote)
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
       }
}

struct InstaTubeView_Previews: PreviewProvider {
    static var previews: some View {
        InstaTubeView(url: URL(string: "https://www.youtube.com")!)
    }
}
