//
//  MathQuizView.swift
//  FinalProjectDemo
//
//  Created by Atsuko Kuwahara on 2022-08-23.
//

import SwiftUI

struct MathQuizView: View {
    @EnvironmentObject var kidVM: KidViewModel
    var menuItem: MenuItem
    //var selectedKid: Kid
    var body: some View {
        
        VStack {
            Text("Correct ansewer: +1,  Incorrect answer: -1")
                .font(.system(size: 20,weight: .medium, design: .rounded))
                .offset(y: -40)
            MathQuizGrid()
            
        }
    }
}

struct MathQuizView_Previews: PreviewProvider {
    static var previews: some View {
        MathQuizView(menuItem: MenuModel().menu[1])
            .environmentObject(KidViewModel())
    }
}
