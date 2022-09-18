//
//  DonateGrid.swift
//  SmartKids
//
//  Created by Atsuko Kuwahara on 2022-09-13.
//

import SwiftUI

struct DonateGrid: View {
    @EnvironmentObject var kidVM: KidViewModel
    @State var showToast = false
    @State var showToastInvalid = false
    @State var buttonTapped = false
    @State var redeemPoints = 0
    
    var redeemList = RedeemModel().redeem
    let colors: [Color] = [.indigo, .yellow, .pink, .purple, .brown]
    
    let adaptiveColumns = [
        GridItem(.adaptive(minimum: 130))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                
                // Model is Identifiable, so we can remove the id parameter
                // ForEach(taskList, id:\.self) { taskItem in
                ForEach(redeemList) { redeemItem in
                    ZStack{
                        Rectangle()
                            .frame(width: 130, height: 130)
                            .foregroundColor(colors[redeemItem.id % 5])
                            .cornerRadius(30)
                        
                        Button(action: {
                            if (kidVM.kid.points - redeemPoints >= redeemItem.points) {
                                self.showToast.toggle()
                                
                                self.redeemPoints += redeemItem.points
                                
                                print(redeemItem.name, ", Redeem total points: \(redeemPoints)")
                            } else{
                                self.showToast = false
                                self.showToastInvalid.toggle()
                            }
                        }) {
                            RedeemRowView(redeemItem: redeemItem)
                        }
                    }
                }
            }
            //Text("Total: \(points)")
            HStack {
                ScoreRowView(text: "Total:", score:"\(redeemPoints)")
                
                Button(action: {
                    self.buttonTapped.toggle()
                    
                    kidVM.kid.points -= redeemPoints
                    print("\(kidVM.kid.user_name)'s saving points: \(kidVM.kid.points)")
                }) {
                    Text("Fin / Redeem")
                        .font(.system(size: 23))
                        .padding(10)
                }
                .background(RoundedRectangle(cornerRadius: 10).stroke(.indigo, lineWidth: 5))
                
                .disabled(buttonTapped)
            }
        }
        .toast(isPresenting: $showToast) {
            AlertToast(type: .systemImage("checkmark.circle", .green), title: "You chose an item!")
        }
        .toast(isPresenting: $showToastInvalid) {
            AlertToast(type: .systemImage("x.circle", .red), title: "Over your points!")
        }
        .padding()
    }
}

struct DonateGrid_Previews: PreviewProvider {
    static var previews: some View {
        DonateGrid()
    }
}
