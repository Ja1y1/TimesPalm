//
//  MapView.swift
//  TimesPalm
//
//  Created by JAY on 21/12/2023.
//

import SwiftUI

struct MapView: View {
   
    var body: some View {
        NavigationView{
            ZStack {
                
                Rectangle()
                    .fill(Color.mapcolor)
                    .ignoresSafeArea()
                
                Image("Map")
                    .resizable()
                    .scaledToFit()
                    .frame(width:987, height:651)
                
                NavigationLink(destination: ContentView()){
                    ZStack {
                        
                        
                        Image("3")
                            .resizable()
                            .scaledToFit()
                    } .frame(width: 280)
                        .position(x: 385, y: 580)
                    
                   
                    }
                NavigationLink(destination: ContentView()){
                    ZStack {
                        
                        
                        Image("2")
                            .resizable()
                            .scaledToFit()
                    }   .frame(width: 200)
                        .position(x: 600, y: 490)
                    
                }
            }
        
        }
    }

}
#Preview {
    MapView()
}
