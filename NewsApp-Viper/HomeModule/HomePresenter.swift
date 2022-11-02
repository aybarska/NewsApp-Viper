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
        //view?.showAlert(with: "Presenter didviewload :)")
        interactor?.getApiData()
    }
    
    func didItemPressed(data: NewsCellViewModel) {
        //AYB make the details module(inside navigation controller). make the router push the vc.
        print("P to R")
        router?.navigateToDetail(with: data)
    }
    
}

extension HomePresenter: InteractorToPresenterHomeProtocol {
    func sendDataToPresenter(newsList: [NewsCellViewModel]) {
        self.view?.updateUI(with: newsList)
    }
    
    
}
