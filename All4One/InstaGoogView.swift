//
//  InstaGoogView.swift
//  All4One
//
//  Created by Peter Khouly on 03/11/2019.
//  Copyright © 2019 Peter Khouly. All rights reserved.
//

import SwiftUI
import WebKit
import Firebase


struct InstaGoogView: View {
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
             WebViewG()
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


struct InstaGoogView_Previews: PreviewProvider {
    static var previews: some View {
        InstaGoogView(url: URL(string: "https://www.youtube.com")!)
    }
}

