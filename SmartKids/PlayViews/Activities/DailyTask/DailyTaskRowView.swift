//
//  DailyTaskRowView.swift
//  FinalProjectDemo
//
//  Created by Atsuko Kuwahara on 2022-08-26.
//

import SwiftUI

struct DailyTaskRowView: View {
    var taskItem: TaskItem
    
    var body: some View {
        VStack {
            ZStack {
                Image("\(taskItem.id)")
                    .resizable()
                    .frame(width: 80, height: 80)
                Text("\(taskItem.points)P")
                    .frame(width: 100, height: 90, alignment: .topTrailing)
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
            }
            Text(taskItem.name)
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .medium, design: .rounded))
            //Spacer()
        }
        
        .padding()
    }
}

struct DailyTaskRowView_Previews: PreviewProvider {
    static var previews: some View {
        DailyTaskRowView(taskItem: testTaskItem)
        
    }
}

