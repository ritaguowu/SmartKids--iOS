//
//  DailyTaskGrid.swift
//  FinalProjectDemo
//
//  Created by Atsuko Kuwahara on 2022-08-26.
//

import SwiftUI

struct DailyTaskGrid: View {
    @EnvironmentObject var kidVM: KidViewModel
    @ObservedObject var resultModel: ResultModel
    @State var showToast = false
    //@State var buttonTapped = false
    @State var dtPoints = 0
    
    var taskId: Int = 0
    var taskList = TaskModel().task
    

    func addItem(taskItem: TaskItem) {
        resultModel.add(taskItem: taskItem)
        print(resultModel.results)
    }
        
    let colors: [Color] = [.red, .green, .blue, .yellow]
    
    let adaptiveColumns = [
        GridItem(.adaptive(minimum: 130))
    ]
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                
                // DailyTaskModel is Identifiable, so we can remove the id parameter
                // ForEach(taskList, id:\.self) { taskItem in
                ForEach(taskList) { taskItem in
                    ZStack{
                        Rectangle()
                            .frame(width: 130, height: 130)
                            .foregroundColor(colors[taskItem.id % 4])
                            .cornerRadius(30)
                        
                        Button(action: {
                            self.addItem(taskItem: taskItem)
                            
                            self.showToast.toggle()
                            
                            self.dtPoints += taskItem.points
                            
                            print(taskItem.name, ", DailyTask total points: \(dtPoints)")
                        }) {
                            DailyTaskRowView(taskItem: taskItem)
                        }
                    }
                }
            }
            //Text("Total: \(points)")
            ScoreRowView(text: "Total:", score:"\(dtPoints)")
            
//            HStack {
//                ScoreRowView(text: "Total:", score:"\(dtPoints)")
//
//                Button(action: {
//                    self.buttonTapped.toggle()
//
//                    self.dtPoints += kidVM.kid.points
//                    kidVM.kid.points = dtPoints
//                    print("\(kidVM.kid.user_name)'s saving points: \(kidVM.kid.points)")
//                }) {
//                    Text("Finish / Add")
//                        .font(.system(size: 23))
//                        .padding(10)
//                }
//                .background(RoundedRectangle(cornerRadius: 10).stroke(.indigo, lineWidth: 5))
//
//                .disabled(buttonTapped)
//            }
        }
        .toast(isPresenting: $showToast) {
            AlertToast(type: .systemImage("checkmark.circle", .green), title: "You added task!")
        }
        //.padding()
    }
    
}




struct DailyTaskGrid_Previews: PreviewProvider {
    static var previews: some View {
        DailyTaskGrid(resultModel: ResultModel(), taskId: 0)
            .environmentObject(KidViewModel())
    }
}
