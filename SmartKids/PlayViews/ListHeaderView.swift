//
//  ListHeaderView.swift
//  FinalProjectDemo
//
//  Created by Atsuko Kuwahara on 2022-09-07.
//

import SwiftUI

struct ListHeaderView: View {
    @ObservedObject var resultModel: ResultModel
    var text: String
    var body: some View {
        HStack {
            Text(text)
                .padding(.leading,2)
                .foregroundColor(Color.white)
            Spacer()
            Text("\(resultModel.totalResultPoints) P")
                .fontWeight(.heavy)
                .padding(5)
        }
        .foregroundColor(Color.white)
        .font(.headline)
        .background(Color.pink)
    }
}

struct ListHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ListHeaderView(resultModel: ResultModel(),text: "Today's Task, Total Points: ")
    }
}
