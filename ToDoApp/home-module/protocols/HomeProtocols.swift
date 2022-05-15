//
//  HomeProtocols.swift
//  ToDoApp
//
//  Created by Ayris Gürbulak on 10.05.2022.
//

import Foundation


protocol ViewToPresenterHomeProtocol {
    
    var homeInteractor: PresenterToInteractorHomeProtocol? { get set}
    var homeView: PresenterToViewHomeProtocol? { get set }
    
    func getAllNotes()
}

protocol PresenterToInteractorHomeProtocol {
    var homePresenter: InteractorToPresenterHomeProtocol? { get set }
    
    func getNotes()
}


protocol InteractorToPresenterHomeProtocol {
    func sendDataToPresenter(noteList: Array<Notes>)
}

protocol PresenterToViewHomeProtocol {
    func sendDataToView(noteList: Array<Notes>)
}


protocol PresenterToRouterHomeProtocol {
    static func createModule(ref: HomeViewController)
}
