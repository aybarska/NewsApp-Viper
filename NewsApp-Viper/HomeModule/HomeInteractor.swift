//
//  HomeInteractor.swift
//  NewsApp-Viper
//
//  Created by Ayberk Mogol on 30.10.2022.
//  
//

import Foundation
import Alamofire

class HomeInteractor: PresenterToInteractorHomeProtocol {
    // MARK: Properties
    var presenter: InteractorToPresenterHomeProtocol?
    var news: [News] = []
    var newsList: [NewsCellViewModel] = []
    
    func getApiData() {
        //alamofire get data
        print("test interactor")
        
        let request = AF.request("https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=9927499270a8403191d4777459bf74c0")
        
        //MARK: make cellmodel from response
        request.responseDecodable(of: News.self) { [self] (response) in
          guard let news = response.value else { return }
            //print(news.articles)
            self.newsList = self.makeViewBasedModel(news.articles)
            //print(newsList)
            presenter?.sendDataToPresenter(newsList: self.newsList)
        }
        
    }
    
}

private extension HomeInteractor {
    @discardableResult
    func makeViewBasedModel(_ news: [Article]) -> [NewsCellViewModel] {
        //make data usabe for view
        //AYB Check this map function
//        if let hotel = hotels.first {
//            return hotel.result.map { .init(hotelNameTrans: $0.hotel_name, address: $0.address, mainPhotoURL: $0.mainPhotoURL) }
//        }
//        return []
        return news.map { .init(title: $0.title, imageUrl:$0.urlToImage) }
    }
}
