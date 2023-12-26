//

//  CorrectAnswer .swift

//  TimesPalm

//

//  Created by Maha on 11/06/1445 AH.

//



//

//  CorrectAnswer .swift

//  TimesPalm

//

//  Created by Maha on 10/06/1445 AH.

//




//

//  CustomPopup.swift

//  TimesPalm

//

//  Created by Maha on 10/06/1445 AH.

//



import SwiftUI


//Positions for dates
private func fixedPositionForDate(index: Int) -> CGPoint {
let positions: [CGPoint] = [
CGPoint(x: 550, y: 160), CGPoint(x: 510, y: 150), CGPoint(x: 660, y: 200), CGPoint(x: 700, y: 210), CGPoint(x: 770, y: 280), CGPoint(x: 670, y: 270), CGPoint(x: 680, y: 330), CGPoint(x: 470, y: 330), CGPoint(x: 480, y: 280), CGPoint(x: 510, y: 240), CGPoint(x: 600, y: 150), CGPoint(x: 630, y: 120), CGPoint(x: 660, y: 100), CGPoint(x: 700, y: 90), CGPoint(x: 470, y: 160), CGPoint(x: 600, y: 200), CGPoint(x: 540, y: 210), CGPoint(x: 635, y: 230), CGPoint(x: 740, y: 230), CGPoint(x: 430, y: 170)]

return positions[index % positions.count]
}



struct CorrectAnswer_: View {
    
    
    @State private var clickedDatesCount: Int = 0
    @State private var isDateClicked: [Bool] = Array(repeating: false, count: 20)
    
    
    @State private var correctAnswer = 0
    @State private var choiceArray: [Int] = [0, 1, 2, 3]
    @State private var secondNumber = 0
    @State private var questionNumber = 1
    @State private var message = ""
    @State private var isShowingPopup = false
    @State private var isShowingPopupFalse = false
    @State private var isShowingPopupFinal = false
    
    
    
    var body: some View {
        
        
        
        ZStack{
            
            Image("Background")
            
                .resizable()
            
                .ignoresSafeArea()
            
            
       
            VStack{
                
                //.scaledToFit()
                
                Rectangle()
                
                    .frame(width: 401, height: 104)
                
                    .foregroundColor(Color.qbkg)
                
                    .cornerRadius(20)
                
                    .overlay(
                        
                        Text("2 x \(secondNumber) = \(clickedDatesCount)")
                        
                            .bold()
                        
                            .font(.system(size: 64))
                        
                            .foregroundColor(.black)
                        
                        
                    )
                    .padding(.top,40)
                    .accessibilityLabel(Text("2 x \(secondNumber) = \(clickedDatesCount)"))
                
                
                
                ZStack{
                    
                    Image("Palmtree")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:500, height: 600)
                    
                    // Add multiple clickable dates as images
                    
                    ForEach(1..<21) { date in
                        if !isDateClicked[date - 1] {
                            Button(action: {
                                // Handle the action for each date
                                print("Date \(date) clicked!")
                                clickedDatesCount += 1
                                isDateClicked[date - 1] = true
                            }) {
                                Image("Date") // Replace with the actual image name
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 70, height: 70)
                                   
                                // Adjust the size as needed
                                //.accessibilityLabel("Date \(date)")
                                // .accessibility(addTraits: .isButton)
                            }
                            .position(fixedPositionForDate(index: date))
                        }
                    }
                }
                
                Button(action: {
                    
                    checkAnswer(clickedDatesCount)
                    
                }) {
                    
                    Text("تحقق")
                    
                        .font(.system(size: 40))
                    
                        .frame(width: 150)
                    
                        .foregroundColor(.white)
                    
                        .padding()
                    
                        .background(Color.button)
                    
                        .cornerRadius(20)
                    
                        .padding(.bottom,30)
                    
                }
                .accessibilityLabel(Text("تحقق"))
                .accessibilityHint(Text("press this button to check your answer"))
                
                
                if isShowingPopup {
                    CustomPopups(isShowingPopup: $isShowingPopup, duration: 2)
                        .zIndex(1)
                }
                
                if isShowingPopupFalse {
                    CustomPopupTwo2(isShowingPopupFalse: $isShowingPopupFalse, duration: 2)
                        .zIndex(1)
                }
                
                
                if isShowingPopupFinal {
                  
                    CustomPopupFinal(isShowingPopupFinal: $isShowingPopupFinal, duration: 2.0)
                    
                        .zIndex(1)
                    
                        .onDisappear {
                            resetGame()
                                }
                    
                }
                
                Text(message)
                    .padding()
            }
          
            
        }
    }
    func checkAnswer(_ clickedDatesCount: Int) {
        if clickedDatesCount == correctAnswer {
            isShowingPopup = true
             generateQuestions()
            self.clickedDatesCount = 0

         } else {
             isShowingPopupFalse = true
             self.clickedDatesCount = 0
             isDateClicked = Array(repeating: false, count: 20)
         }

         if questionNumber == 10 {
             isShowingPopupFinal = true
         } else {
             // Increment questionNumber only if the answer is correct
             questionNumber += 1
         }
     }
    
    func generateQuestions() {
        secondNumber = questionNumber
        correctAnswer = secondNumber * 2
        isDateClicked = Array(repeating: false, count: 20)
    }
    
    
    
    func resetGame() {
        questionNumber = 1
        clickedDatesCount = 0
        isDateClicked = Array(repeating: false, count: 20)
        generateQuestions()
    }

    
    
    
    struct CustomPopups: View {
        
        @Binding var isShowingPopup: Bool
        var duration: TimeInterval
    
        
        var body: some View {
            ZStack {
                VStack {
                    Spacer()
                    
                    VStack{
                    
                        
                        
                        Text("اجابة صحيحة! ")
                            .font(.system(size: 40))
                            .foregroundColor(.black)
                            .padding()
                        
                        
                        Image(systemName: "checkmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
                            .foregroundColor(.button)
                        
                    }
                    Spacer()
                }.accessibilityLabel(Text("اجابة صحيحة! "))
                    .accessibilityHint(Text("right answer"))
                
                .frame(width: 464, height: 283)
                .background(Color.answer)
                .cornerRadius(20)
                .padding(.top, -550)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    isShowingPopup = false
                }
            }
        }
    }
    
    struct CustomPopupTwo2: View {
        @Binding var isShowingPopupFalse: Bool
        
        var duration: TimeInterval
        
        var body: some View {
            VStack {
                Spacer()
                
                Text("إجابة خاطئة")
                    .padding()
                    .font(.system(size: 40))
                   
                Text("حاول مرة اخرى")
                
                    .font(.system(size: 40))
                    .foregroundColor(.black)
                //  .padding()
                
                Button(action: {
                    isShowingPopupFalse = false
                }) {
                    Image("replay")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.bottom,20)
                    
                        .cornerRadius(10)
                }
                
                // Spacer()
            } .accessibilityLabel(Text("اجابة خاطئة"))
                .accessibilityHint(Text("wrong answer"))
            
                .accessibilityLabel(Text("حاول مرة اخرى"))
                .accessibilityHint(Text("try again"))
            
            .frame(width: 464, height: 283)
            .background(Color.false)
            .cornerRadius(20)
            .padding(.top,-550)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    isShowingPopupFalse = false
                    
                }
            }
           
        }
    }
    
    struct CustomPopupFinal: View {
        @Binding var isShowingPopupFinal: Bool
        
        var duration: TimeInterval
        var body: some View {
            VStack{
                Text("احسنت!")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding(.vertical)
                
                Image("Ribbon")
                    .aspectRatio(contentMode: .fit)
                    .position(x:220, y:150)
                
                    .scaleEffect(0.40)
                
                
                Text("انهيت الجدول كاملا")
                    .font(.title)
                    .padding()
                
                
                Spacer()
            } .accessibilityLabel(Text("احسنت"))
                .accessibilityHint(Text("good job"))
            
                .accessibilityLabel(  Text("انهيت الجدول كاملا"))
                .accessibilityHint(Text("you finished the whole table"))
            
            .frame(width: 464, height: 395)
            .background(Color.qbkg)
            .cornerRadius(20)
            .padding(.top,-550)
            
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    isShowingPopupFinal = false
                    
                }
            }
        }
    }
    
    
    
}

#Preview {

    CorrectAnswer_()

}


