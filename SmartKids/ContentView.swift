//
//  ContentView.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-04.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var loginVM : LoginViewModel
    
    @State private var hasTimeElapsed = false
    
    var body: some View {

         ZStack{
             Image("ic_splash_background")
                 .resizable()
                 .aspectRatio( contentMode: .fill)
                 .edgesIgnoringSafeArea(.all)
             VStack {
                 Text("SmartKids")
                     .font(Font.custom("sacramento", size: 50))
                     .foregroundColor(Color.white)
                     .bold()
                 .padding()

             }
         }.task(delayText)
         .navigate(to: WelcomeView(), when: $hasTimeElapsed)
         .onAppear{
             loginVM.getParent()
         }

    }
    
    @Sendable private func delayText() async {
        // Delay of 2.5 seconds (1 second = 1_000_000_000 nanoseconds)
        try? await Task.sleep(nanoseconds: 2_500_000_000)
        hasTimeElapsed = true
    }
}

extension UIImage {
    var base64: String? {
        self.jpegData(compressionQuality: 1)?.base64EncodedString()
    }
}

extension String {
    var imageFromBase64: UIImage? {
        guard let imageData = Data(base64Encoded: self, options: .ignoreUnknownCharacters) else {
            return nil
        }
        return UIImage(data: imageData)
    }
}


extension View{
    /// Navigate to a new view.
    /// - Parameters:
    ///   - view: View to navigate to.
    ///   - binding: Only navigates when this condition is `true`.
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(true)

                NavigationLink(
                    destination: view
                        .navigationBarHidden(true),
                    isActive: binding
                ) {
                    EmptyView()
                }
            }
        }
    }
    
    
    func textViewStyle() -> some View{
        modifier(ShadowViewModifier())
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
