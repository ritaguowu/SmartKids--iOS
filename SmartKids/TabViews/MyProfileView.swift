//
//  MyProfileView.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-05.
//

import SwiftUI

struct MyProfileView: View {
    @EnvironmentObject var loginVM: LoginViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State var parent = decodeObject(key: "parent")
    @State var pwd1 = ""
    @State var pwd2 = ""
    @State var newImage = ""
    @State var imageUI: UIImage?
    
    
    @State var isNotSamePwd = false
    @State private var isShowSheet: Bool = false
    
    
    @State private var selection = "None"
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    
    
    
    var body: some View {
        
        VStack {
            
            Text("My Profile")
                .fontWeight(.bold)
                .font(.system(size: 35))
                .padding(25)
            
            
            TextField("Name", text: $parent.user_name)
                .padding()
                .textViewStyle()
            
            
            
            TextField("Password", text: $pwd1)
                .padding()
                .textViewStyle()
            
            
            TextField("Repeat Password", text: $pwd2)
                .padding()
                .textViewStyle()
                .padding(.bottom, 30)
            
            
            HStack{
                Image(uiImage: imageUI ?? UIImage(named: "icons-person")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                    .padding(20)
                
                Spacer()
                
                Button(){
                    self.isShowSheet = true
                    
                } label:{
                    Text("Add Photo")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                }.padding(30)
                    .confirmationDialog("Select Photo", isPresented: $isShowSheet, titleVisibility: .visible) {
                                    Button("Photo Library") {
                                        self.showImagePicker = true
                                        self.sourceType = .photoLibrary
                                    }

                                    Button("Camera") {
                                        self.showImagePicker = true
                                        self.sourceType = .camera
                                    }
                    }
            }.sheet(isPresented: $showImagePicker){
                ImagePicker(image: $imageUI, isShown: self.$showImagePicker, sourceType: self.sourceType)
            }
            
            Button(){
                if (pwd1 != pwd2){
                    isNotSamePwd = true
                }else{
                    if (pwd1 != ""){
                    parent.password = pwd1
                    }
                    convertImageToString()
                    loginVM.updateParent(userNew: parent)
                    presentationMode.wrappedValue.dismiss()
                }
                
            } label:{
                ButtonView(text: "Update")
            }.cornerRadius(15)
                .padding(30)
                .alert(isPresented: self.$isNotSamePwd){
                    Alert(title: Text("Error"), message: Text("Sorry, not same password!"), dismissButton: .default(Text("OK")))
                }
            Spacer(minLength: 80)
            
        }.padding(.all)
    }
    
    func convertImageToString(){
        guard imageUI != nil else {
            parent.image = parent.image
            return
            }
        parent.image = imageUI!.base64!
     }
}

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileView()
    }
}
