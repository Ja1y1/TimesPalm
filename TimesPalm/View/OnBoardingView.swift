//
//  OnBoardingView.swift
//  TimesPalm
//
//  Created by Wajd Alhadlaq on 08/06/1445 AH.
//

import SwiftUI

struct OnboardingPage: Identifiable {
    var id = UUID()
    let palmImage: String
    let basketImage: String
    let description: String
    let equation: String
    let correct: String
}

struct OnboardingPageView: View {
    let onboardingPage: OnboardingPage

    var body: some View {
        ZStack {
   
            Image(onboardingPage.basketImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .position(x:-1000, y:1300)
                .scaleEffect(0.19) // Move scaleEffect after position

           /* Text(onboardingPage.description)
                .padding()
                .font(.system(size:32))
                .foregroundColor(.oBtext)
                .frame(width: 500, height: 156)
                .background(Color.onboarding) // Set the background color here
                .cornerRadius(20)
                .position(x: 950, y: 250)
                .multilineTextAlignment(.center)
             */

            VStack {
                
                    Text(onboardingPage.equation)
                        .font(.system(size: 64))
                        .bold()
                        .frame(width: 401, height: 104)
                        .background(Color.qbkg) // Set the background color here
                        .cornerRadius(20)
                ZStack{
                    Image(onboardingPage.palmImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 500, height: 500)
                
                    
                    Image(onboardingPage.correct)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 464, height: 283)
                    
                    
                    Text(onboardingPage.description)
                        .padding()
                        .font(.system(size:32))
                        .foregroundColor(.oBtext)
                        .frame(width: 500, height: 156)
                        .background(Color.onboarding) // Set the background color here
                        .cornerRadius(20)
                        .position(x: 900, y: 80)
                        .multilineTextAlignment(.center)

                    
                }
                Text("تحقق")
                .font(.system(size: 40))
                .padding()
                .frame(width: 164, height:104)
                .foregroundColor(.white)
                .background(Color.button)
                .cornerRadius(20)
            }
            
        }
    }
}

struct OnboardingView: View {
    @State var currentPage = 0
    
    let onboardingPages = [
        OnboardingPage(palmImage: "Palmwithdates", basketImage: "Basket", description: "سؤال من جدول الضرب المراد حله",equation:" 2 x 2 = ?",correct: ""),
        OnboardingPage(palmImage: "Palmwithdates2", basketImage: "Basket", description: "اجمع حبات التمر في السلة لحل المعادلة والتحقق من الجواب",equation:" 2 x 2 = ?",correct: ""),
        OnboardingPage(palmImage: "Palmwithdates3", basketImage: "Basketwithdates", description: "ظهور الحل والإجابة الصحيحة بعد التحقق",equation:" 2 x 2 = 4",correct: "Correct"),
    ]
    
    
    var body: some View {
        
        ZStack{
            VStack {
                TabView(selection: $currentPage) {
                    ForEach((0..<onboardingPages.count).reversed(), id: \.self) { index in
                        OnboardingPageView(onboardingPage: onboardingPages[index])
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                
                
                
                
                .background(
                    Image("OnboardingBG")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: 1000,height: 1000)
                    
                )
                
                Spacer()
                
                
                HStack {
                    
                    Spacer()
                    Button(action: {
                        withAnimation {
                            if currentPage < onboardingPages.count - 1 {
                                currentPage += 1
                            } else {
                                // Handle completion or navigate to the main app
                            }
                        }
                    }) {
                        Text(currentPage < onboardingPages.count - 1 ? "التالي" : "ابدأ اللعب")
                            .frame(width:180, height:50)
                            .foregroundColor(.white)
                            .font(.system(size:30))
                            .background(
                             RoundedRectangle(cornerRadius: 10)
                             .fill(Color.next)
                            )
                               }
                    .padding(.trailing,960)
                    .padding(.bottom,10)
                           }
                    
                       }
             
            }
            
        }
    }
    

  
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}


