//
//  MathquizTwo.swift
//  FinalProjectDemo
//
//  Created by Atsuko Kuwahara on 2022-08-31.
//

import SwiftUI

enum Sign: String {
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "X"
}

enum Operation {
    case add, subtract, multiply, divide, none
}

struct MathquizTwo: View {
    @EnvironmentObject var kidVM: KidViewModel
    
    @State var showToast = false
    @State var buttonTapped = false
    @State var showAlert = false
    
    @State var correctAnswer = 0
    @State var choiceArray: [Int] = [0,1,2,3,4,5]
    @State var firstNumber = 0
    @State var secondNumber = 0
    @State var mqScore = 0
    @State var difficulty = 50
    @State var currentOperation: Operation = .none
    
    let signs: [Sign] = [.add, .subtract, .multiply, .divide]
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Image("classroom")
                    .resizable()
                    .scaledToFit()
                    .opacity(0.3)
            }
            
            VStack {
                Text("\(firstNumber) + \(secondNumber) = ?")
                    .font(.largeTitle)
                    .bold()
                
                HStack{
                    ForEach(0..<3) { index in
                        Button {
                            answerIsCorrect(answer: choiceArray[index])
                            generateAnswers()
                        }label: {
                            AnswerButton(number:  choiceArray[index])
                        }
                    }
                }
                HStack{
                    ForEach(3..<6) { index in
                        Button {
                            answerIsCorrect(answer: choiceArray[index])
                            generateAnswers()
                        }label: {
                            AnswerButton(number:  choiceArray[index])
                        }
                    }
                }
                
                HStack {
                    ScoreRowView(text: "Score:", score:"\(mqScore)")
                    Button(action: {
                        self.buttonTapped.toggle()
                        self.showAlert.toggle()
                        // TO DO
                        
                        self.mqScore += kidVM.kid.points
                        
                        kidVM.kid.points = mqScore
                        print("\(kidVM.kid.user_name)'s saving points: \(kidVM.kid.points)")
                    }) {
                        Text("Finish / Add")
                            .font(.system(size: 23))
                            .padding(10)
                    }
                    .background(RoundedRectangle(cornerRadius: 10).stroke(.indigo, lineWidth: 5))
                    
                    
                    .disabled(buttonTapped)
                }
                
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Score's added!")

                    )
                }
//                Text("Score: \(score)")
//                    .font(.system(size: 30, design: .rounded))
//                    .bold()
                Spacer()
            }.onAppear(perform: generateAnswers)
        }.padding(.bottom)
    }
    
    
    func answerIsCorrect(answer: Int) {
        let isCorrect = answer == correctAnswer ? true : false
        
        if isCorrect {
            self.mqScore += 1
        } else {
            self.mqScore -= 1
        }
    }
    
    func generateAnswers() {
        firstNumber = Int.random(in: 0...(difficulty/2))
        secondNumber = Int.random(in: 0...(difficulty/2))
        var answerList = [Int]()
        
//        switch sign {
//        case .add, .subtract, .multiply, .divide:
//            if sign == .add {
//                self.currentOperation = .add
//                correctAnswer = firstNumber + secondNumber
//            }
//            if sign == .subtract {
//                self.currentOperation = .subtract
//                correctAnswer = firstNumber - secondNumber
//            }
//            if sign == .multiply {
//                self.currentOperation = .multiply
//                correctAnswer = firstNumber * secondNumber
//            }
//            if sign == .divide {
//                self.currentOperation = .divide
//                correctAnswer = firstNumber / secondNumber
//            }
//        default:
//            break
//        }
        correctAnswer = firstNumber + secondNumber
        
        
        for _ in 0...4 {
            answerList.append(Int.random(in: 0...difficulty))
        }
        answerList.append(correctAnswer)
        choiceArray = answerList.shuffled()
    }
    
}

struct MathquizTwo_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            MathquizTwo()
                .previewInterfaceOrientation(.portrait)
                .environmentObject(KidViewModel())
            
            MathquizTwo()
                .previewDevice("iPhone 12")
                .environmentObject(KidViewModel())
        }
    }
}
