//
//  ResultRowView.swift
//  FinalProjectDemo
//
//  Created by Atsuko Kuwahara on 2022-09-07.
//

import SwiftUI

struct ResultRowView: View {
    var resultItem: ResultItem
    var body: some View {
        VStack {
            HStack(alignment: .firstTextBaseline){
                Image(systemName: "\(resultItem.id).square")
                Text(resultItem.name)
                    .font(.headline)
                Spacer()
                Text("\(resultItem.points)")
                    .bold()
            }
            
        }.padding(.horizontal)
    }
}

struct ResultRowView_Previews: PreviewProvider {
    static var previews: some View {
        ResultRowView(resultItem: testResultItem)
    }
}
