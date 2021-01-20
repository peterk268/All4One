//
//  SettingsView.swift
//  All4One
//
//  Created by Peter Khouly on 27/10/2019.
//  Copyright © 2019 Peter Khouly. All rights reserved.
//

import SwiftUI
import Firebase

struct SettingsView: View {
    var bannerView: GADBannerView!
    

    
    var body: some View {
        VStack{
            Text("Settings").fontWeight(.heavy)
                .font(.largeTitle)
                .padding(.trailing, 165)
            
                .padding(.bottom, 50)
        HStack {
            NavigationLink(destination: ContentView(url: URL(string: "https://www.youtube.com")!)) {
                Image("all3").resizable().frame(width: 140, height: 140)
            }
            Spacer()
            
            NavigationLink(destination: InstaTubeView(url: URL(string: "https://www.youtube.com")!)) {
                Image("InstaU").resizable().frame(width: 140, height: 140)
            }

        }.padding(.leading, 50)
            .padding(.trailing, 50)
            .padding(.bottom, 35)
            
            HStack {
                       NavigationLink(destination: GoogTubeView(url: URL(string: "https://www.youtube.com")!)) {
                           Image("googu").resizable().frame(width: 140, height: 140)
                       }
                       Spacer()
                       
                       NavigationLink(destination: InstaGoogView(url: URL(string: "https://www.youtube.com")!)) {
                           Image("instag").resizable().frame(width: 140, height: 140)
                       }

            }.padding(.leading, 50)
                       .padding(.trailing, 50)
                       Spacer()
            
        HStack{
            GADBannerViewController()
                .frame(height: 50)
        }.padding(.trailing, 0)
            .padding(.leading, 0)
            
        }.navigationBarTitle("Settings")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

