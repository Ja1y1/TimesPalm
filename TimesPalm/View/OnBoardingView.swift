//
//  OnBoardingView.swift
//  TimesPalm
//
//  Created by Wajd Alhadlaq on 08/06/1445 AH.
//



import SwiftUI

struct OnboardingView: View {
    @State private var currentPage = 0
    
    let onboardingPages = [
        OnboardingPage(palmImage: "Palmwithdates", basketImage:"", description: "Discover amazing features."),
        OnboardingPage(palmImage: "Palmwithdates", basketImage:"", description: "Discover amazing features."),
        OnboardingPage(palmImage: "Palmwithdates", basketImage:"", description: "Discover amazing features."),
    ]

    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(0..<3) { index in
                    OnboardingPageView(onboardingPage: onboardingPages[index] )
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))

      
            }
        }
    }


struct OnboardingPage: Identifiable {
    var id = UUID()
    let palmImage: String
    let basketImage: String
    let description: String
}

struct OnboardingPageView: View {
    let onboardingPage: OnboardingPage
    
    var body: some View {
        ZStack{
            Image("OnboardingBG")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                
            
            
            
            Image("Basket")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaleEffect(0.19)
                .position(x:300,y:600)
            
            
            
            Text("سؤال")
            
                .font(.system(size: 40))
                .frame(width: 509,height: 156)
                .background(.yellow)
                .cornerRadius(20)
                .position(x:1000,y:250)
            
            VStack {
                
                Text("2 x 2 =")
                
                    .font(.system(size: 64))
                    .bold()
                    .frame(width: 401,height: 104)
                    .background(.cyan)
                    .cornerRadius(20)
                
                Image("palmWithDates")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 500,height: 500)
                
                
                
                Button("تحقق") {
                    // Handle button tap action here
                }
                .font(.system(size: 40))
                .padding() // Add padding to the button for better appearance
                .frame(width: 164,height: 104)
                .foregroundColor(.white) // Set text color
                .background(Color.green) // Set button background color
                .cornerRadius(20)
                
                
                
            }
            
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
