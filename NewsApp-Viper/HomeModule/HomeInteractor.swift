//
//  HomeInteractor.swift
//  NewsApp-Viper
//
//  Created by Ayberk Mogol on 30.10.2022.
//  
//

import Foundation

class HomeInteractor: PresenterToInteractorHomeProtocol {
    // MARK: Properties
    var presenter: InteractorToPresenterHomeProtocol?
    var news: [News] = []
    var newsCell: [NewsCellViewModel] = []
    
    func getApiData() {
        //
    }
}
