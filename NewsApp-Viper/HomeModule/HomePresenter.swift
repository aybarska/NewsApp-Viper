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
        //view?.showAlert(with: "Presenter didviewload :)")
        interactor?.getApiData()
    }
    
    func didItemPressed(at index: IndexPath) {
        //
    }
    
    func didApiDataFetch() {
        //
        //view?.updateUI(with: interactor.newsCell)
    }
    
    func didApiDataCouldntFetch() {
        //
    }
    
}

extension HomePresenter: InteractorToPresenterHomeProtocol {
    func sendDataToPresenter(newsList: [NewsCellViewModel]) {
        print("presenter again")
        
        self.view?.updateUI(with: newsList)
    }
    
    
}
