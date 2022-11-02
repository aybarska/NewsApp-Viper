//
//  HomeRouter.swift
//  NewsApp-Viper
//
//  Created by Ayberk Mogol on 30.10.2022.
//  
//

import Foundation
import UIKit

class HomeRouter: PresenterToRouterHomeProtocol {
    
    
   
        static func execModule(ref: HomeViewController) {
            let presenter = HomePresenter()
            //View
            ref.HomePresenter = presenter
            //Presenter
            ref.HomePresenter?.interactor = HomeInteractor()
            ref.HomePresenter?.view = ref
            //Interactor
            ref.HomePresenter?.interactor?.presenter = presenter
            //Router
            ref.HomePresenter?.router = HomeRouter()
        }
    

    
    func navigateToDetail(with news: NewsCellViewModel) {
        DetailViewController().item = news
    }
    
}
