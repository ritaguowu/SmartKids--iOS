//
//  PointsView.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-05.
//

import SwiftUI

struct PointsView: View {
    
    @EnvironmentObject var kidsListVM: KidsListViewModel
    

    var body: some View {
        VStack{
            HStack{
                ParentInfoView()
            }.background(Color("Secondary"))
                .padding(.top, 50)
                .onAppear{
                    kidsListVM.getAllKids()
                }
            
            Group{
                if kidsListVM.kids.count > 0{
                    
                    List{
                            ForEach(kidsListVM.kids, id: \.id) { kid in
                                
                                KidPointsCell(kid: kid.kid)
                            }.listRowBackground(Color("Primary"))
                            .padding(.leading)
                    }.background(Color.secondary)
                    
                }else{
                    Text("No kid has been found!")
                        .foregroundColor(Color.white)
                }
                
            }
            Spacer()
                }
            }
}



struct PointsView_Previews: PreviewProvider {
    static var previews: some View {
        PointsView()
    }
}
