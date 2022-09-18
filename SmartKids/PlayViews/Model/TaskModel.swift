//
//  TaskModel.swift
//  FinalProjectDemo
//
//  Created by Atsuko Kuwahara on 2022-08-26.
//

import Foundation
//import SwiftUI

struct TaskItem: Identifiable, Hashable {
    var id: Int
    var name: String
    var points: Int
    
//    private var imageName: String
//    var image: Image {
//        Image(imageName)
//    }
}

let testTaskItem = TaskItem(id: 102, name: "Get Up", points: 3)

struct TaskModel {
    var task: [TaskItem] = [
        TaskItem(id: 100, name: "Homework", points: 1),
        TaskItem(id: 101, name: "Brush Teeth", points: 2),
        TaskItem(id: 102, name: "Get Up", points: 3),
        TaskItem(id: 103, name: "School", points: 4),
        TaskItem(id: 104, name: "Meal Time", points: 5),
        TaskItem(id: 105, name: "Cleaning", points: 1),
        TaskItem(id: 106, name: "Get Food", points: 2),
        TaskItem(id: 107, name: "Reading", points: 3),
        TaskItem(id: 108, name: "Bath Time", points: 4),
        TaskItem(id: 109, name: "Exercising", points: 5),
        TaskItem(id: 110, name: "Wash Hands", points: 1),
        TaskItem(id: 111, name: "Outside Time", points: 2),
        TaskItem(id: 112, name: "Quiet Time", points: 3),
        TaskItem(id: 113, name: "Bed Time", points: 4),
        TaskItem(id: 114, name: "Helping ", points: 5),
    ]
}
