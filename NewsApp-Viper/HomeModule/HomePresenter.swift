//
//  HomePresenter.swift
//  NewsApp-Viper
//
//  Created by Ayberk Mogol on 30.10.2022.
//  
//

import Foundation

class HomePresenter: ViewToPresenterHomeProtocol {

    
    // MARK: Properties
    var view: PresenterToViewHomeProtocol?
    var interactor: PresenterToInteractorHomeProtocol?
    var router: PresenterToRouterHomeProtocol?
    
    func didViewLoad() {
        //
        print("presenter didload")
        view?.showAlert(with: "Presenter didviewload :)")
    }
    
    func didItemPressed(at index: IndexPath) {
        //
    }
    
    func didApiDataFetch() {
        //
    }
    
    func didApiDataCouldntFetch() {
        //
    }
    
}

extension HomePresenter: InteractorToPresenterHomeProtocol {
    
}
