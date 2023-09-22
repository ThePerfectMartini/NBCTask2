import Foundation
import UIKit


class DataManager {
    
    var tasks:[Task]?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var reloadClosure = {}
    
    //불러오기
    func fetchTask(){
        do{
            self.tasks = try context.fetch(Task.fetchRequest())
        } catch {
            print("테스트 - error")
        }
        DispatchQueue.main.async {
            self.reloadClosure()
        }
    }
    
    func saveAndFetch(){
        do{
            try self.context.save()
            self.fetchTask()
            
        } catch {
            print("테스트 - error")
        }
    }
    
    func deleteAndFetch(){ // 마지막요소 제거
        
        if self.tasks!.count != 0 {
            
            let taskToRemove = self.tasks!.last!
            
            self.context.delete(taskToRemove)
            
            saveAndFetch()

        }

        
    }
    
    func append(_ title:String){
        let newTask = Task(context: self.context)
        newTask.title = title
        newTask.isCompleted = false
        newTask.date = Date()
        newTask.id = UUID()
        
        saveAndFetch()
    }
    
    func edit(_ index:Int){
        let task = self.tasks![index]
        task.isCompleted.toggle()
        task.modifyDate = Date()
        
        saveAndFetch()
    }

    
}
