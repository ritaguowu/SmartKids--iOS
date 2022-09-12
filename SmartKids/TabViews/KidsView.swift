//
//  KidsView.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-05.
//

import SwiftUI

struct KidsView: View {
    @EnvironmentObject var kidsListVM: KidsListViewModel
    @StateObject var kidVM = KidViewModel()
    @State var addKid = false
     
    var body: some View {
        NavigationView{
                VStack{
                    HStack{
                        ParentInfoView()
                    }.background(Color("Secondary"))
                        .padding()
                        .onAppear{
                            kidsListVM.getAllKids()
                        }
                    
                    Group{
                        if kidsListVM.kids.count > 0{
                            
                            List{
                                Section{
                                    ForEach(kidsListVM.kids, id: \.id) { kid in
                                        
                                        NavigationLink(destination: KidPlayView(selectedKid: kid.kid),
                                                       
                                                       label:{
                                            KidCell(kid: kid.kid)
                                        })
                                        
                                    }.onDelete(perform: delete)
                                }.listRowBackground(Color("Primary"))
                                    .padding(.leading)
                            }.background(Color.secondary)
                            
                        }else{
                            Text("No kid has been found!")
                                .foregroundColor(Color.white)
                        }
                        Spacer()
                    }
                }.padding(.horizontal).navigationBarItems(trailing:
                        Button(action: {
                    self.addKid = true
                }, label: {
                    Image(systemName: "plus.circle.fill")
                })
                )
            
        }.sheet(isPresented: $addKid) {
            VStack{
                Text("Kid Name 🖊")
                    .padding(30)
                    
                TextField("Kid Name", text: $kidVM.kidName)
                    .padding(.horizontal)
                        .frame(height: 55)
                        .background(Color(#colorLiteral(red: 0.9364585876, green: 0.9716410041, blue: 1, alpha: 1)))
                        .foregroundColor(Color.black)
                        .cornerRadius(10)
                    Button(action:{
                       
                        kidVM.addKid(kidName: kidVM.kidName)
                        
//                        if (kidVM.isValidKid){
                            
//                              kidsListVM.addKidToList(kidVM.kid)

//                        }
                        self.addKid = false
                        
                    } , label: {
                        ButtonView(text: "SAVE")
                    })
                }.padding(100)
                .onDisappear(){
                    kidsListVM.getAllKids()
                }
            }
    }
    
    
    func delete(at offsets: IndexSet) {
        offsets.forEach{
            index in
            let deleteKid = kidsListVM.kids[index]
            kidVM.deleteKid(kidId: deleteKid._id)
        }        
        kidsListVM.kids.remove(atOffsets: offsets)

    }
    

    
}



struct KidsView_Previews: PreviewProvider {
    static var previews: some View {
        KidsView().environmentObject(KidViewModel())
            .environmentObject(LoginViewModel())
            .environmentObject(KidsListViewModel())
    }
}
