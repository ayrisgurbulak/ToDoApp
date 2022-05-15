//
//  Notes.swift
//  ToDoApp
//
//  Created by Ayris Gürbulak on 10.05.2022.
//

import Foundation

class Notes {
    
    var note_id: Int?
    var note: String?
    var isDone: Int?
    
    init(note_id: Int, note: String, isDone: Int) {
        self.note_id = note_id
        self.note = note
        self.isDone = isDone
    }
}
