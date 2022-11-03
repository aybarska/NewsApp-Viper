//
//  BookmarksPresenter.swift
//  NewsApp-Viper
//
//  Created by Ayberk Mogol on 3.11.2022.
//  
//

import Foundation

class BookmarksPresenter: ViewToPresenterBookmarksProtocol {

    // MARK: Properties
    var view: PresenterToViewBookmarksProtocol?
    var interactor: PresenterToInteractorBookmarksProtocol?
    var router: PresenterToRouterBookmarksProtocol?
    
    func didViewLoad() {
        print("b presenter")
        interactor?.getCoreData()
    }
    
    func didItemPressed(data: Bookmarks) {
        //
    }
}

extension BookmarksPresenter: InteractorToPresenterBookmarksProtocol {
    func sendDataToPresenter(bookmarksList: [Bookmarks]) {
        self.view?.updateUI(with: bookmarksList)
    }
    
    
}
