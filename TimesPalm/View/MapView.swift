//
//  MapView.swift
//  TimesPalm
//
//  Created by JAY on 21/12/2023.
//

import SwiftUI
struct MapView: View {
    var body: some View {
        NavigationView {
            
            ZStack{
                Rectangle()
                    .fill(Color.mapcolor)
                    .ignoresSafeArea()
                
                Image("Map")
                    .resizable()
                    .scaledToFit()
                   // .frame(maxWidth: 987, maxHeight: 651) // Set the maximum width and height
                
               
                    Image("1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 280)
                        .position(x: 345, y: 595)
                        .accessibilityLabel(Text("جدول ضرب واحد"))
                
                ZStack {
                 
                    
                    NavigationLink(destination: CorrectAnswer_()){
                        
                                
                                Image("2")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200)
                                    .position(x: 600, y: 500)
                                    .accessibilityLabel(Text("جدول ضرب اثنان"))
                            }
                  
                }
            }
     
            
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Add this line to use compact navigation view style
    }
}
#Preview {
    MapView()
}
