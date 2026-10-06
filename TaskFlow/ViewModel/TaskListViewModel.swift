//
//  TaskListViewModel.swift
//  TaskFlow
//
//  Created by Jonathan Heinzman on 9/30/26.
//

import Foundation
import Combine

class TaskListViewModel: ObservableObject {
    @Published var tasks: [TaskItem] = []
    
    // MARK: Class #1 Functions
    /// Add Task Function
    func addTask(title: String) {
        let trimmed = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        tasks.append(TaskItem(title: trimmed))
    }
    
    /// Delete Task Function
    func removeTask(at index: Int) {
        guard tasks.indices.contains(index) else { return }
        tasks.remove(at: index)
    }
    
    /// toggle completion function
    func toggleCompletion(id: UUID) {
        guard let index = tasks.firstIndex(where: { $0.id == id }) else { return }
        tasks[index].isCompleted.toggle()
    }
    
    /// Completed Count Text
    var completedCount: Int {
        tasks.filter { $0.isCompleted }.count
    }
    
    
}
