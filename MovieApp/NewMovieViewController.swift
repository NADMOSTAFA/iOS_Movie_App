//
//  NewMovieViewController.swift
//  MovieApp
//
//  Created by JETSMobileLabMini2 on 24/04/2024.
//

import UIKit
import Cosmos

class NewMovieViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var moviieImage: UIImageView!
    @IBOutlet weak var movieRating: CosmosView!
    @IBOutlet weak var movieYear: UITextField!
    @IBOutlet weak var movieGenre: UITextField!
    @IBOutlet weak var movieTitle: UITextField!
    var newMovie : Movie!
    var movieProtocol: MovieProtocol?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func addMovie(_ sender: Any) {
       // let movieDb = MovieDB.instance
//        newMovie = Movie(title: movieTitle.text ?? "", rating: Float(movieRating.rating), year: movieYear.text ?? "", genre: movieGenre.text ?? "", image: moviieImage.image!  , arr: movieGenre.text ?? "")
        
        let alert = UIAlertController(title: "Invalid Input", message: "Title Field is required", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        if(movieTitle.text!.isEmpty){
            self.present(alert, animated: true)
            
        }else{
//            movieDb.insert(title: movieTitle.text! as NSString, rating: Float(movieRating.rating), year: movieYear.text! as NSString, genre: movieGenre.text! as NSString, movieImage: moviieImage.image?.pngData() ?? Data())
            
            //movieProtocol?.addNewMovie(movie: newMovie)
            self.navigationController?.popViewController(animated: true)
        }
        
        
    }
    
    @IBAction func addImage(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            present(imagePicker, animated: true)
        }else{
            print("No Photo Library")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        moviieImage.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        picker.dismiss(animated: true)
    }
}
