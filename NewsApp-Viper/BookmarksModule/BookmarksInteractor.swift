//
//  BookmarksInteractor.swift
//  NewsApp-Viper
//
//  Created by Ayberk Mogol on 3.11.2022.
//  
//

import Foundation

class BookmarksInteractor: PresenterToInteractorBookmarksProtocol {
    // MARK: Properties
    var presenter: InteractorToPresenterBookmarksProtocol?
    var bookmarksList = [Bookmarks]()
    
    func getCoreData() {
        self.bookmarksList = CoreDataManager.shared.getAllBookmarks()
        presenter?.sendDataToPresenter(bookmarksList: self.bookmarksList)
    }
}
