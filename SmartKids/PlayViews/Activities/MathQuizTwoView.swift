//
//  MathQuizTwoView.swift
//  SmartKids
//
//  Created by Atsuko Kuwahara on 2022-09-11.
//

import SwiftUI

struct MathQuizTwoView: View {
    @EnvironmentObject var kidVM: KidViewModel
    var menuItem: MenuItem
    //var selectedKid: Kid
    var body: some View {
        
        VStack {
            Text("Correct ansewer: +1,  Incorrect answer: -1")
                .font(.system(size: 20,weight: .medium, design: .rounded))
                .offset(y: -30)
            MathquizTwo()
            
        }
    }
}

struct MathQuizTwoView_Previews: PreviewProvider {
    static var previews: some View {
        MathQuizTwoView(menuItem: MenuModel().menu[2])
            .environmentObject(KidViewModel())
    }
}
