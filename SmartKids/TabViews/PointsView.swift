//
//  PointsView.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-05.
//

import SwiftUI

struct PointsView: View {
    
    @EnvironmentObject var kidsListVM: KidsListViewModel
    
//    @State var fruits:[String] = [
//        "apple", "ornage", "banana", "peach"
//    ]
//
    var body: some View {
            VStack {
                
                List{
        
                        ForEach(kidsListVM.kids, id: \.id){kid in
                            KidCell(kid: kid.kid)
                        }.onDelete(perform: delete)
                    
                }.navigationTitle("SwiftUI")
                    .toolbar {
                        ToolbarItemGroup(placement: .bottomBar) {
                            Button("First") {
                                print("Pressed")
                            }

                            Button("Second") {
                                print("Pressed")
                            }
                        }
                    }
                }
            }
            

    func delete(at offsets: IndexSet) {
        kidsListVM.kids.remove(atOffsets: offsets)
    }
}
//        VStack{
//            Text("Kids Points")
//                .bold()
//                .foregroundColor(Color.blue)
//
//
//            List{
//                ForEach(kidsListVM.kids, id: \.id) { kid in
//
//                        KidCell(kid: kid.kid)
//
//                }.onDelete(perform: delete)
//            }.background(Color.blue)
//            .listStyle(PlainListStyle())
//        }
//    }
//
//}

struct PointsView_Previews: PreviewProvider {
    static var previews: some View {
        PointsView()
    }
}
