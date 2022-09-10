//
//  KidsView.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-05.
//

import SwiftUI

struct KidsView: View {
    @StateObject private var loginVM = LoginViewModel()
    @StateObject private var kidsListVM = KidsListViewModel()
    @StateObject private var kidViewModel = KidViewModel()

//    let parent = decodeObject(key: "parent")

    
    var body: some View {
        ZStack{
            Color("Secondary")
        
        VStack{
            HStack{
                Image("default_user")
                    .resizable()
                            .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 60)
                    .clipShape(Circle())

                VStack{
                    Text("\(loginVM.perant.user_name)")
                    Text("\(loginVM.perant.email)")
                }.foregroundColor(Color.white)
                
                Spacer()
            }.background(Color("Secondary"))
            .padding(30)
            .onAppear{
                    kidsListVM.getAllKids()
                }

            
                if kidsListVM.kids.count > 0{

                    List{
                        ForEach(kidsListVM.kids, id: \.id) { kid in
                            Button(){
                                kidViewModel.loadKid(kidId: kid._id)
                            }
                        label:{
                                HStack{
                                    Image("default_kid")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50, height: 70)
                                        .clipShape(Circle())

                                    Text("\(kid.user_name)")
                                        .foregroundColor(Color.white)
                                    
                                }
                        }.fullScreenCover(isPresented: $kidViewModel.isValidKid){
                            KidPlayView()
                            }
//                        .onDelete{indexSet in
//                            kidsListVM.kids.remove(atOffsets: indexSet)
//                        }
                        }.listRowBackground(Color("Primary"))
//                            .onMove{
//                                indexSet, index in
//                                kidsListVM.kids.move(fromOffsets: indexSet, toOffset: index)
//                            }
                    }
                }else{
                    Text("No kid has been found!")
                        .foregroundColor(Color.white)
                }
            Spacer()
        }
        }
    }
}


struct KidsView_Previews: PreviewProvider {
    static var previews: some View {
        KidsView()
        
    }
}
