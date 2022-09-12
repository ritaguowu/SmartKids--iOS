//
//  ParentView.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-05.
//

import SwiftUI

struct ParentView: View {
    
    var body: some View {

        TabView{

            KidsView()
                .tabItem{
                    Image(systemName: "house")
                    Text("Kids")
                }
            
            PointsView()
                .tabItem{
                    Image(systemName: "plus.circle")
                    Text("Points")
                }
                
            MyProfileView()
                .tabItem{
                    Image(systemName: "gearshape.fill")
                    Text("Setting")
                }
            
        }
    }
}

struct ParentView_Previews: PreviewProvider {
    static var previews: some View {
        ParentView()
    }
}
