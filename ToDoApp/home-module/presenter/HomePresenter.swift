//
//  HomePresenter.swift
//  ToDoApp
//
//  Created by Ayris Gürbulak on 10.05.2022.
//

import Foundation


class HomePresenter: ViewToPresenterHomeProtocol {
    
    var homeInteractor: PresenterToInteractorHomeProtocol?
    
    var homeView: PresenterToViewHomeProtocol?
    
    func getAllNotes() {
        homeInteractor?.getNotes()
    }
    
    
}

extension HomePresenter: InteractorToPresenterHomeProtocol {
    func sendDataToPresenter(noteList: Array<Notes>) {
        homeView?.sendDataToView(noteList: noteList)
    }
    
}
