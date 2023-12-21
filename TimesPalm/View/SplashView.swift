//
//  SplashView.swift
//  TimesPalm
//
//  Created by JAY on 20/12/2023.
//

import SwiftUI

struct SplashView: View {
    @State var isActive: Bool = false
    var body: some View {
        ZStack{
            if self.isActive{
                //MapView()
            }
                else{
                Rectangle()
                Color.splashbkg
                    .ignoresSafeArea()
                
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width:451, height:494)
//                    
//                    VStack{
//                        Text("Times Palm")
//                            .font(.largeTitle)
//                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                            .frame(width: 308, height:78)
//                    }.padding(.top, 500.0)
               
            }
            
        }
        
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                withAnimation{
                self.isActive = true
                }
            }
            
        }    }
}

#Preview {
    SplashView()
}
