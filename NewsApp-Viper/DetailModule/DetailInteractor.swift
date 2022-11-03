//
//  DetailInteractor.swift
//  NewsApp-Viper
//
//  Created by Ayberk Mogol on 2.11.2022.
//  
//

import Foundation
import CoreData
import FirebaseAnalytics

class DetailInteractor: PresenterToInteractorDetailProtocol {
    var bookmark = [Bookmarks]()
    
    // MARK: Properties
    var presenter: InteractorToPresenterDetailProtocol?

    func addBookmark(data: NewsCellViewModel) {
        CoreDataManager.shared.saveBookmark(title: data.title!, imageUrl: data.imageUrl!, content: data.content!)
        self.bookmark = CoreDataManager.shared.getAllBookmarks()
        //SEND firebase analytics
        Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
          AnalyticsParameterItemName: data.title!,
          //AnalyticsParameterContentType: data.content!,
        ])
        
    }
    
    func deleteBookmark(data: Bookmarks) {
        CoreDataManager.shared.deleteBookmark(bookmarks: data)
    }
}
