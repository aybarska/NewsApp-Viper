//
//  HomeContract.swift
//  NewsApp-Viper
//
//  Created by Ayberk Mogol on 30.10.2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewHomeProtocol {
    func updateUI(with items: [NewsCellViewModel])
    func showLoading()
    func hideLoading()
    func showAlert(with message: String?)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterHomeProtocol {
    
    var view: PresenterToViewHomeProtocol? { get set }
    var interactor: PresenterToInteractorHomeProtocol? { get set }
    var router: PresenterToRouterHomeProtocol? { get set }
    
    func didViewLoad()
    func didItemPressed(data: NewsCellViewModel)
    
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorHomeProtocol {
    
    var presenter: InteractorToPresenterHomeProtocol? { get set }
    //var news: [News] { get }
    func getApiData()
    
    
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterHomeProtocol {
    func sendDataToPresenter(newsList:[NewsCellViewModel])
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterHomeProtocol {
    func navigateToDetail(with news: NewsCellViewModel)
    
}


struct NewsCellViewModel {
    var title: String?
    var imageUrl: String?
    var content: String?
}

// MARK: - News
struct News: Decodable {
    let status: String
    let articles: [Article]
}

// MARK: - Article
struct Article: Decodable {
    let author, title: String
    let url: String
    let urlToImage: String
    let content: String
}

