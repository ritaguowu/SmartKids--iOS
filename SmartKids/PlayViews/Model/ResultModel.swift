//
//  RdsultModel.swift
//  FinalProjectDemo
//
//  Created by Atsuko Kuwahara on 2022-09-07.
//

import Foundation
import Combine

struct ResultItem: Identifiable {
    var id: Int
    var taskId: Int
    var name: String
    var points: Int
}

// The Model for holding result
class ResultModel: ObservableObject {
    let task = TaskModel()
    @Published var results: [ResultItem] = []
    
    var lastId: Int = -1
    
    // Create newId based on lastId
    private func newId() -> Int {
        lastId += 1
        return lastId
    }
    
    // Return total points
    var totalResultPoints: Int {
        var totalResultPoints = 0
        for item in results {
            totalResultPoints += item.points
        }
        return totalResultPoints
    }
    
    // Return last "resultId". If not found, gives -1
    var lastResultId: Int {
        results.last?.id ?? -1
    }

    // Add an item to ResultList by task name
    func add(taskItem: TaskItem) {
        let result = ResultItem(id: newId(), taskId: taskItem.id, name: taskItem.name, points: taskItem.points)
        //results += [result]
        self.results.append(result)
    }
}

// test copy
let testResultModel = ResultModel()
let testResultItem = ResultItem(id: 1, taskId: 108, name: "Bath Time", points: 4)

