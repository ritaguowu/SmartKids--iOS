//
//  ContentHeaderView.swift
//  FinalProjectDemo
//
//  Created by Atsuko Kuwahara on 2022-08-20.
//

import SwiftUI

struct ContentHeaderView: View {
    
    //@StateObject var kidVM = KidViewModel()
    @EnvironmentObject var kidVM: KidViewModel
    //var selectedKid: Kid
    
    var body: some View {
        
            HStack (spacing: 5){
                Text("Hi, \(kidVM.kid.user_name)!")
                .font(.system(size: 36,weight: .medium, design: .rounded))
            Spacer()
            
                CircleImage()
        }
    
        .padding()
        .background(Color.blue)
        
    }
}

struct ContentHeaderView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentHeaderView()
            .environmentObject(KidViewModel())
    }
}
