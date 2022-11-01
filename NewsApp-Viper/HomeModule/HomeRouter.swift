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
    
    
    // MARK: Static methods
//    static func createModule() -> UIViewController {
//
//        let viewController = HomeViewController()
//
//        let presenter: ViewToPresenterHomeProtocol & InteractorToPresenterHomeProtocol = HomePresenter()
//
//        viewController.HomePresenter = presenter
//        viewController.HomePresenter?.router = HomeRouter()
//        viewController.HomePresenter?.view = viewController
//        viewController.HomePresenter?.interactor = HomeInteractor()
//        viewController.HomePresenter?.interactor?.presenter = presenter
//
//        return viewController
//    }
    
   
        static func execModule(ref: HomeViewController) {
            let presenter = HomePresenter()
            //View
            ref.HomePresenter = presenter
            //Presenter
            ref.HomePresenter?.interactor = HomeInteractor()
            ref.HomePresenter?.view = ref
            //Interactor
            ref.HomePresenter?.interactor?.presenter = presenter
        }
    

    
    func navigateToDetail(with news: News) {
        //
    }
}
