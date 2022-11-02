//
//  DetailPresenter.swift
//  NewsApp-Viper
//
//  Created by Ayberk Mogol on 2.11.2022.
//  
//

import Foundation

class DetailPresenter: ViewToPresenterDetailProtocol {
    

    // MARK: Properties
    var view: PresenterToViewDetailProtocol?
    var interactor: PresenterToInteractorDetailProtocol?
    var router: PresenterToRouterDetailProtocol?
    
    func sendBookmarkAdd(data: NewsCellViewModel) {
        interactor?.addBookmark(data: data)
        
    }
    
    func sendBookmarkDelete(data: Bookmarks) {
        interactor?.deleteBookmark(data: data)
    }

}

extension DetailPresenter: InteractorToPresenterDetailProtocol {
    
}
