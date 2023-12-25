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
    let description: String
    let equation: String
    let correct: String
}

struct OnboardingPageView: View {
    let onboardingPage: OnboardingPage

    
    var body: some View {
        ZStack {
   
          

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
                
                    if !onboardingPage.correct.isEmpty {
                                           Text(onboardingPage.correct)
                                               .font(.system(size: 40))
                                               .foregroundColor(.black)
                                               .frame(width: 464, height: 283)
                                               .background(Color.answer)
                                               .cornerRadius(20)
                                               .multilineTextAlignment(.center)
                                               .offset(y: onboardingPage.correct.isEmpty ? -500 : 0) // Move offscreen if empty
                                               .opacity(onboardingPage.correct.isEmpty ? 0 : 1) // Hide if empty
                        }
                                       
                       
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
                .frame(width: 150)
                .foregroundColor(.white)
                .background(Color.button)
                .cornerRadius(20)
               
            }.accessibilityLabel(Text("تحقق"))
                .accessibilityHint(Text("press this button to check your answer"))
                
            
        }
        
      
    }
}



struct OnboardingView: View {
    @State var currentPage = 0
    @State var goToMapView = false
    
    let onboardingPages = [
        OnboardingPage(palmImage: "Palmwithdates", description: "سؤال من جدول الضرب المراد حله",equation:" 2 x 2 = ?",correct: ""),
        OnboardingPage(palmImage: "Palmwithdates3", description: "اجمع حبات التمر عبر الضغط عليها لحل المعادلة والتحقق من الجواب",equation:" 2 x 2 = 3",correct: ""),
        OnboardingPage(palmImage: "Palmwithdates3", description: "ظهور الحل والإجابة الصحيحة بعد التحقق",equation:" 2 x 2 = 4",correct: "إجابة صحيحة!"),
    ]
    
    
    var body: some View {
        NavigationStack {
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
                    
                    
                    
                    HStack {
                                           if currentPage < onboardingPages.count - 1 {
                                               Button(action: {
                                                   withAnimation {
                                                       currentPage += 1
                                                   }
                                               }) {
                                                   Text("التالي")
                                                       .frame(width: 180, height: 50)
                                                       .foregroundColor(.white)
                                                       .font(.system(size: 30))
                                                       .background(
                                                           RoundedRectangle(cornerRadius: 10)
                                                               .fill(Color.next)
                                                       )
                                               }.padding(.horizontal,40)
                                           } else {
                                               NavigationLink(destination: MapView()){
                                                   Text("ابدأ اللعب")
                                                       .frame(width: 180, height: 50)
                                                       .foregroundColor(.white)
                                                       .font(.system(size: 30))
                                                       .background(
                                                           RoundedRectangle(cornerRadius: 10)
                                                               .fill(Color.next)
                                                       )
                                                       .padding(.horizontal,40)
                                                       .navigationDestination(isPresented: $goToMapView) {
                                                           MapView()
                                                       }
                                               }
                                           }
                                           
                                           
                           
                        
                        Spacer()
                        
                            .accessibilityLabel( Text("ابدا اللعب"))
                                .accessibilityHint(Text("start playing"))
                             
                        Button(action: {
                            withAnimation {
                                if currentPage < onboardingPages.count - 1 {
                                    currentPage = onboardingPages.count - 1
                                } else {
                                    goToMapView = true
                                }
                            }
                        }) {
                            Text("تخطي")
                                .frame(width:180, height:50)
                                .foregroundColor(.black)
                                .font(.system(size:30))
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.yellow)
                                )
                        }
                        .accessibilityLabel( Text("تخطي"))
                            .accessibilityHint(Text("skip"))
                         
                        .padding(.horizontal,40)
                    }
                    
                }
            }
            }
        .navigationViewStyle(StackNavigationViewStyle())
        }
    }
    

  
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}


