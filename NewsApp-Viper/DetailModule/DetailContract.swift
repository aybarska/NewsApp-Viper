//
//  DetailContract.swift
//  NewsApp-Viper
//
//  Created by Ayberk Mogol on 2.11.2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewDetailProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterDetailProtocol {
    
    var view: PresenterToViewDetailProtocol? { get set }
    var interactor: PresenterToInteractorDetailProtocol? { get set }
    var router: PresenterToRouterDetailProtocol? { get set }
    
    func sendBookmarkAdd(data: NewsCellViewModel)
    func sendBookmarkDelete(data: Bookmarks)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorDetailProtocol {
    
    var presenter: InteractorToPresenterDetailProtocol? { get set }
    func addBookmark(data: NewsCellViewModel)
    func deleteBookmark(data: Bookmarks)
    
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterDetailProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterDetailProtocol {
    
}
