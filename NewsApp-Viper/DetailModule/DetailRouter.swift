//
//  DetailRouter.swift
//  NewsApp-Viper
//
//  Created by Ayberk Mogol on 2.11.2022.
//  
//

import Foundation
import UIKit

class DetailRouter: PresenterToRouterDetailProtocol {
    
    static func execModule(ref: DetailViewController) {
        let presenter = DetailPresenter()
        //View
        ref.DetailPresenter = presenter
        //Presenter
        ref.DetailPresenter?.interactor = DetailInteractor()
        ref.DetailPresenter?.view = ref
        //Interactor
        ref.DetailPresenter?.interactor?.presenter = presenter
        //Router
        ref.DetailPresenter?.router = DetailRouter()
    }
}
