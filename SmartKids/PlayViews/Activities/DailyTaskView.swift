//
//  DailyTaskView.swift
//  FinalProjectDemo
//
//  Created by Atsuko Kuwahara on 2022-08-25.
//

import SwiftUI

struct DailyTaskView: View {
    @EnvironmentObject var kidVM: KidViewModel
    @ObservedObject var resultModel: ResultModel
    @State var isTaskDisplayed: Bool = true
    @Binding var bigPoints: Int
    var menuItem: MenuItem
   
    var body: some View {
        VStack {
            Button(action: {
                self.isTaskDisplayed.toggle()
                //print("Result view")
            }) {
                Text("Review Result")
                    .font(.system(size: 30,weight: .medium, design: .rounded))
            }
            
            DailyTaskGrid(resultModel: resultModel)
                .layoutPriority(isTaskDisplayed ? 1.0 : 0.5)
            
            ResultListView(resultModel: resultModel, bigPoints: self.$bigPoints)
                .layoutPriority(isTaskDisplayed ? 0.5 : 1.0)
        }
    }
}

struct DailyTaskView_Previews: PreviewProvider {
    static var previews: some View {
        DailyTaskView(resultModel: ResultModel(), bigPoints: .constant(0), menuItem: MenuModel().menu[0])
            .environmentObject(KidViewModel())
    }
}
