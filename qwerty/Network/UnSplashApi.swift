//
//  UnSplashApi.swift
//  qwerty
//
//  Created by Joonho Hwangbo on 2020/11/23.
//

import Foundation
import Combine


class UnSplashApi : ObservableObject{
    
    @Published var photos : [Photo] = []
    @Published var searchText: String = "Cat"
    @Published var loading: Bool = false
    @Published var curPage: Int = 1
    @Published var totalPages: Int = 0
    @Published var totalPhotos: Int = 0
    var searchViewState: SearchViewState
    private var disposables = Set<AnyCancellable>()

    
    init(searchViewState: SearchViewState){
        self.searchViewState = searchViewState
        self.searchViewState.$dst
            .debounce(for: .milliseconds(100), scheduler: DispatchQueue.main).removeDuplicates()
            .sink { searchText in
                self.loadData(searchText: searchText)
        }.store(in: &disposables)
    }
    
    func getUrl(searchText: String, page: Int = 1) -> String {
        var _searchText = searchText
        if( searchText.isEmpty) {
            return "";
        }
        var text = _searchText.components(separatedBy: ",")
        var _cat = "";
        if(text.count > 1){
            _searchText = text[text.count-1].trimmingCharacters(in: .whitespacesAndNewlines);
            text.removeLast()
            _cat = text.joined(separator: ",")
        } else {
            _searchText = text[0].trimmingCharacters(in: .whitespacesAndNewlines)
        }
        
        let safeText = _searchText.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!

        let key = "NdUC2vca-l_jsifGjq1Le64pvHSqjpOVaxGMRODagLA"
        let safeUrl = "https://api.unsplash.com/search/photos/?page=\(page)&query=\(safeText)&client_id=\(key)"
        return safeUrl
    }
    
    func loadData(searchText: String){
        self.curPage = 1
        self.searchText = searchText
        let searchUrl = getUrl(searchText: searchText)
        
        if(searchUrl.isEmpty) {
            return
        }
        guard let url = URL(string: searchUrl) else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url:url)
        self.loading = true
        URLSession.shared.dataTask(with: request){data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data){
                    DispatchQueue.main.async {
                        self.photos = decodedResponse.results
                        self.totalPages = decodedResponse.total_pages
                        self.totalPhotos = decodedResponse.total
                        self.loading = false
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
    
    func loadMore(){
        let searchUrl = getUrl(searchText: self.searchText, page: self.curPage+1)
        guard let url = URL(string: searchUrl) else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url:url)
        URLSession.shared.dataTask(with: request){data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data){
                    DispatchQueue.main.async {
                        self.photos.append(contentsOf: decodedResponse.results)
                    }
                    return
                }
            }
            print("Load MoreFetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
    
    func isLastPhoto(_ photo:Photo) -> Bool {
        if let last = self.photos.last {
            return last == photo
        }
        return false
    }
}

