//
//  HomePresenter.swift
//  MovieApp
//
//  Created by JETSMobileLabMini2 on 09/05/2024.
//

import Foundation

protocol HomePresenterProtocol{
    func loadData()
    func getMovies() -> [Movie]
    func getMoviesCount() -> Int
    func getMovie() -> Movie
    func setMovie(movie: Movie)
}

class HomePresenter : HomePresenterProtocol{
    var network : NetworkServiceProtocol
    var view : ViewProtocol
    var movies : [Movie] = []
    var movie : Movie?
    
    init(network: NetworkServiceProtocol, view: ViewProtocol) {
        self.network = network
        self.view = view
    }
    
    func loadData(){
        network.fetchData { movieList in
            DispatchQueue.main.async {
                self.movies = movieList
                self.view.loadData()
            }
        }
    }
    
    func getMovies() -> [Movie]{
        return movies
    }
    
    func getMoviesCount() -> Int {
        return movies.count
    }
    
    func setMovie(movie: Movie)  {
        self.movie = movie
    }
    
    func getMovie() -> Movie{
        return movie!
    }
    
}
  
