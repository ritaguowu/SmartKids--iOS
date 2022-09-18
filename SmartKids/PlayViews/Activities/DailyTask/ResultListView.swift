//
//  ResultListView.swift
//  FinalProjectDemo
//
//  Created by Atsuko Kuwahara on 2022-09-07.
//

import SwiftUI

struct ResultListView: View {
    @EnvironmentObject var kidVM: KidViewModel
    @ObservedObject var resultModel: ResultModel
    //@ObservedObject var kidViewModel: KidViewModel
    @State var buttonTapped = false
    
    @Binding var bigPoints: Int
    
    var body: some View {
        VStack {
            
            List{
                Section(
                    header: ListHeaderView(resultModel: self.resultModel,text:"Today's Result")
                ){
                    ForEach(resultModel.results){item in
                        ResultRowView(resultItem: item)
                    }
                    .onDelete(perform: delete)
                }
                
            }.toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    EditButton()
                }
            }
            
            Button(action: {
                self.buttonTapped.toggle()
                
                bigPoints += resultModel.totalResultPoints
                kidVM.kid.points += resultModel.totalResultPoints
                
                //Update points
                kidVM.updateKid(kid: kidVM.kid)
                print("\(kidVM.kid.user_name)'s saving points: \(kidVM.kid.points)")
                
            }) {
                Text("Finish / Add")
                    .font(.system(size: 23))
                    .padding(10)
            }
            .background(RoundedRectangle(cornerRadius: 10).stroke(.indigo, lineWidth: 5))
            
            .disabled(buttonTapped)
        }
    
    }
    func delete(at offsets: IndexSet){
        resultModel.results.remove(atOffsets: offsets)
    }
}

struct ResultListView_Previews: PreviewProvider {
    static var previews: some View {
        ResultListView(resultModel: ResultModel(), bigPoints: .constant(0))
            .environmentObject(KidViewModel())
    }
}
