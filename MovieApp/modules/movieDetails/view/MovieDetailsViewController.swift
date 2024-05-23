//
//  MovieDetailsViewController.swift
//  MovieApp
//
//  Created by JETSMobileLabMini2 on 24/04/2024.
//

import UIKit
import Cosmos
import Kingfisher

class MovieDetailsViewController: UIViewController {
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieGnre: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var rating: CosmosView!
    let detailsPresenter : MovieDetailsPresenterProtocol = MovieDetailsPresenter()
    var honePresenter : HomePresenterProtocol?
    
    //var movie : Movie!

    override func viewDidLoad() {
        super.viewDidLoad()
        var movie = honePresenter!.getMovie()
        movieTitle.text = movie.title
        movieYear.text = String(movie.year)
        movieGnre.text = movie.genre.joined(separator: ",")
        movieImage.kf.setImage(with: URL(string: movie.image))
        rating.rating = Double(movie.rating -  5.0 )
        rating.settings.updateOnTouch = false
    }

}
