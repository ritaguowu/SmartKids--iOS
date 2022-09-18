//
//  MathQuizGrid.swift
//  FinalProjectDemo
//
//  Created by Atsuko Kuwahara on 2022-08-30.
//

import SwiftUI
import Combine


enum CalcButton: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case equal = "\u{2713}"
    case clear = "CLEAR"
    case decimal = "."
    case negative = "-/+"
    case start = "START"
    
    var buttonColor: Color {
        switch self {
        case .equal, .clear, .start:
            return .orange
        case .decimal, .negative:
            return .indigo
        default:
            return .green
        }
    }
    
}

struct MathQuizGrid: View {
    // 3 X 5
    var calcButtons: [CalcButton] = [
        CalcButton.one, CalcButton.two, CalcButton.three,
        CalcButton.four, CalcButton.five, CalcButton.six,
        CalcButton.seven, CalcButton.eight, CalcButton.nine,
        CalcButton.decimal, CalcButton.zero, CalcButton.negative,
        CalcButton.start, CalcButton.equal, CalcButton.clear
    ]
    
    let adaptiveColumns = [
        GridItem(.adaptive(minimum: 70))
    ]
    
    // if 3(columns) X 5 grid
    //    private var columns = [
    //        GridItem(.flexible(minimum: 100)),
    //        GridItem(.flexible(minimum: 100)),
    //        GridItem(.flexible(minimum: 100))
    //    ]
    
    @State var digits: String = "0"
    @State var textQ: String = ""
    @State var showToast = false
    @State var textResult: String = ""
    @State var textImage: String = ""
    @State var buttonTapped = false
    @State var showAlert = false
    @State var showAlert2 = false
    
    @State var correctAnswer = 0
    @State var firstNumber = 0
    @State var secondNumber = 0
    @State var mqScore = 0
    @State var difficulty = 50
    
    @EnvironmentObject var kidVM: KidViewModel
    //var selectedKid: Kid
    
    var body: some View {
        VStack{
            VStack {
                HStack {
                    ScoreRowView(text: "Score:", score:"\(mqScore)")
                    Button(action: {
                        self.buttonTapped.toggle()
                        self.showAlert.toggle()
                        // TO DO
                        
                        self.mqScore += kidVM.kid.points
                        
                        kidVM.kid.points = mqScore
                        
                        //Update points
                        kidVM.updateKid(kid: kidVM.kid)
                        print(kidVM.kid)
                        
                        
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
                .alert(isPresented: $showAlert2) {
                    Alert(
                        title: Text("Start New Game")

                    )
                }
                
                QuestionRowView(text: "Qestion: ", question: "\(textQ)")
                
                AnswerRowView(text: "Answer: ", yourAnswer: "\(digits)")
                
            }
            
            //Spacer()
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 5) {
                    ForEach(calcButtons, id: \.self) { item in
                        ZStack {
                            Rectangle()
                                .frame(width: 70, height: 70)
                                .foregroundColor(item.buttonColor)
                                .cornerRadius(30)
                                .overlay(
                                    Text(item.rawValue)
                                        .font(.system(size: 22))
                                        .foregroundColor(.black)
                                ).onTapGesture {
                                    didTap(button: item)
                                    
                                }
                        }
                    }
                    .padding(5)
                }
            }
            
        }
        .toast(isPresenting: $showToast) {
            AlertToast(type: .systemImage("\(textImage)", .red), title: "\(textResult)")
        }
        .ignoresSafeArea(edges: .top)
    }
    
    func answerIsCorrect(digits: String) {
        let isCorrect = self.digits == "\(correctAnswer)" ? true : false
        
        if isCorrect {
            self.mqScore += 1
            self.textResult = "Correct!"
            self.textImage = "circle.circle"
            
        } else {
            self.mqScore -= 1
            self.textResult = "Incorrect!"
            self.textImage = "x.circle"
        }
        print("Your answer: ",self.digits)
        generateAnswers()
        self.digits = "0"
    }
    
    func generateAnswers() {
        firstNumber = Int.random(in: 0...(difficulty/2))
        secondNumber = Int.random(in: 0...(difficulty/2))
        
        correctAnswer = firstNumber + secondNumber
        textQ = "\(firstNumber) + \(secondNumber) = ?"
        print(textQ, "correct answer: ",correctAnswer)
    }
    
    func didTap(button: CalcButton) {
        switch button {
        case .equal:
            answerIsCorrect(digits: "")
            showToast.toggle()
        case .clear:
            self.digits = "0"
        case .decimal:
            if !digits.contains(".") {
                digits += "."
            }
        case .negative:
            if digits.hasPrefix("-") {
                digits = String(digits.dropFirst())
            } else {
                digits = "-" + digits
            }
        case .start:
            generateAnswers()
            self.mqScore = 0
            showAlert2.toggle()
            
        default:
            let number = button.rawValue
            if self.digits == "0" {
                digits = number
            }
            else {
                self.digits = "\(self.digits)\(number)"
            }
        }
            
    }
    
}

struct MathQuizGrid_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            MathQuizGrid()
                .environmentObject(KidViewModel())
                .previewInterfaceOrientation(.portrait)
            
            MathQuizGrid()
                .environmentObject(KidViewModel())
                .previewDevice("iPhone 12")
        }
    }
}
