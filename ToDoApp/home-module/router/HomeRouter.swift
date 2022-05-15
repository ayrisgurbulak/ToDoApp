//
//  HomeRouter.swift
//  ToDoApp
//
//  Created by Ayris Gürbulak on 10.05.2022.
//

import Foundation


class HomeRouter: PresenterToRouterHomeProtocol {
    static func createModule(ref: HomeViewController) {
        
        let presenter = HomePresenter()
        
        ref.homePresenterObject = presenter
        
        ref.homePresenterObject?.homeView = ref
        ref.homePresenterObject?.homeInteractor = HomeInteractor()
        
        ref.homePresenterObject?.homeInteractor?.homePresenter = presenter
    }
}
