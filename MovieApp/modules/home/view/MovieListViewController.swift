//
//  ViewController.swift
//  MovieApp
//
//  Created by JETSMobileLabMini2 on 24/04/2024.
//

import UIKit

protocol ViewProtocol{
    func loadData() 
}

class MovieListViewController: UIViewController, ViewProtocol {
    @IBOutlet weak var movieTable: UITableView!
    let indicator = UIActivityIndicatorView(style: .medium)
    var homePresenter : HomePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homePresenter = HomePresenter(network: NetworkService(), view: self)
        homePresenter?.loadData()
        setIndicator()
        movieTable.dataSource = self
        movieTable.delegate = self
    
    }
    
    func loadData()  {
        self.movieTable.reloadData()
        self.indicator.stopAnimating()
    }
    
    func setIndicator() {
        indicator.center = self.view.center
        indicator.startAnimating()
        self.view.addSubview(indicator)
    }
    

    
    @IBAction func btnAdd(_ sender: Any) {
      //  let newMovie :  NewMovieViewController = self.storyboard?.instantiateViewController(identifier:"newMovie") as! NewMovieViewController
        // self.navigationController?.pushViewController(newMovie, animated: true)
       // newMovie.movieProtocol = self
    }
    

    
}


extension MovieListViewController : UITableViewDelegate , UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homePresenter!.getMoviesCount()
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = homePresenter?.getMovies()[indexPath.row].title
        cell.imageView?.image = UIImage(systemName: "movieclapper")
        cell.imageView?.tintColor = UIColor(.green)
        cell.accessoryType = .disclosureIndicator

        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nav : MovieDetailsViewController = self.storyboard?.instantiateViewController(identifier: "movie") as! MovieDetailsViewController
        
        //nav.movie = homePresenter?.getMovies()[indexPath.row]
        
        //let selectedMovie = MovieDetailsPresenter()
        homePresenter?.setMovie(movie: homePresenter!.getMovies()[indexPath.row])
        nav.honePresenter = homePresenter
        self.navigationController?.pushViewController(nav, animated: true)
        
    }

    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete  = UIContextualAction(style: .destructive, title: "Delete") { action, view, completionHandler in
            let alert = UIAlertController(title: "Confirmation Required", message: "Are you sure you want to delete?", preferredStyle: .actionSheet)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            }))
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .destructive))
            self.present(alert, animated: true)
            
            completionHandler(true)
        }
        let config = UISwipeActionsConfiguration(actions: [delete])
        return config
    }
    
    
    
    
}

