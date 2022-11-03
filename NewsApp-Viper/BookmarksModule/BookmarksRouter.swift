//
//  BookmarksRouter.swift
//  NewsApp-Viper
//
//  Created by Ayberk Mogol on 3.11.2022.
//  
//

import Foundation
import UIKit

class BookmarksRouter: PresenterToRouterBookmarksProtocol {
    
    // MARK: Static methods
    static func execModule(ref: BookmarksViewController) {
        
        let presenter = BookmarksPresenter()
        //View
        ref.BookmarksPresenter = presenter
        //Presenter
        ref.BookmarksPresenter?.interactor = BookmarksInteractor()
        ref.BookmarksPresenter?.view = ref
        //Interactor
        ref.BookmarksPresenter?.interactor?.presenter = presenter
        //Router
        ref.BookmarksPresenter?.router = BookmarksRouter()
    }
    
}
