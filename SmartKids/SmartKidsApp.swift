//
//  SmartKidsApp.swift
//  SmartKids
//
//  Created by Wu Guo on 2022-09-04.
//

import SwiftUI

@main
struct SmartKidsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

//Add customizations for an individual platform

//extension View {
//    func iOS<Content: View>(_ modifier: (Self) -> Content) -> some View {
//        #if os(iOS)
//        return modifier(self)
//        #else
//        return self
//        #endif
//    }
//}
//
//extension View {
//    func macOS<Content: View>(_ modifier: (Self) -> Content) -> some View {
//        #if os(macOS)
//        return modifier(self)
//        #else
//        return self
//        #endif
//    }
//}
//
//extension View {
//    func tvOS<Content: View>(_ modifier: (Self) -> Content) -> some View {
//        #if os(tvOS)
//        return modifier(self)
//        #else
//        return self
//        #endif
//    }
//}
//
//extension View {
//    func watchOS<Content: View>(_ modifier: (Self) -> Content) -> some View {
//        #if os(watchOS)
//        return modifier(self)
//        #else
//        return self
//        #endif
//    }
//}
