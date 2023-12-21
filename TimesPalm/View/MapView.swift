//
//  MapView.swift
//  TimesPalm
//
//  Created by JAY on 21/12/2023.
//

import SwiftUI

struct MapView: View {
    var body: some View {
        ZStack {

            Rectangle()
                .fill(Color.mapcolor)
                .ignoresSafeArea()
            
            Image("Map")
                .resizable()
                .scaledToFit()
                .frame(width:987, height:651)
//          Image("2")
//                .resizable()
//                .scaledToFit()
//                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
//            
//            Image("3")
//                  .resizable()
//                  .scaledToFit()
//                  .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
//             
//           
            
            
           
        }
       
    }
}

#Preview {
    MapView()
}
