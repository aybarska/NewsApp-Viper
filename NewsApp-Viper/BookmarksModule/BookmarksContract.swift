//
//  BookmarksContract.swift
//  NewsApp-Viper
//
//  Created by Ayberk Mogol on 3.11.2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewBookmarksProtocol {
    func updateUI(with items: [Bookmarks])
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterBookmarksProtocol {
    
    var view: PresenterToViewBookmarksProtocol? { get set }
    var interactor: PresenterToInteractorBookmarksProtocol? { get set }
    var router: PresenterToRouterBookmarksProtocol? { get set }
    
    func didViewLoad()
    func didItemPressed(data: Bookmarks)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorBookmarksProtocol {
    
    var presenter: InteractorToPresenterBookmarksProtocol? { get set }
    
    func getCoreData()
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterBookmarksProtocol {
    func sendDataToPresenter(bookmarksList:[Bookmarks])
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterBookmarksProtocol {
    
}
