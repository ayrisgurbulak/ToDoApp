//
//  HomeInteractor.swift
//  ToDoApp
//
//  Created by Ayris Gürbulak on 10.05.2022.
//

import Foundation

class HomeInteractor: PresenterToInteractorHomeProtocol {
    
    let db: FMDatabase?
    
    init() {
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: targetPath).appendingPathComponent("ToDo.db")
        
        db = FMDatabase(path: databaseURL.path)
    }
    
    var homePresenter: InteractorToPresenterHomeProtocol?
    
    func getNotes() {
        db?.open()
        
        var notes = [Notes]()
        
        do {
            let query = try db!.executeQuery("SELECT * FROM Notes", values: nil)
            
            while query.next() {
                let note = Notes(note_id: Int(query.string(forColumn: "noteId"))!, note: query.string(forColumn: "note"), isDone: Int(query.string(forColumn: "isDone"))!)
                
                notes.append(note)
            }
            
            homePresenter?.sendDataToPresenter(noteList: notes)
            
        } catch  {
            print(error.localizedDescription)
        }
        
        db?.close()
        
        
    }
    
    
}
