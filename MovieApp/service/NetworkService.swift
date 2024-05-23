//
//  NetworkService.swift
//  MovieApp
//
//  Created by JETSMobileLabMini2 on 09/05/2024.
//

import Foundation


protocol NetworkServiceProtocol{
    func fetchData(completionHandler: @escaping ([Movie]) -> Void)
}


class NetworkService : NetworkServiceProtocol {
    
    
    func fetchData(completionHandler: @escaping ([Movie]) -> Void){
        
        // URL
        let url = URL(string: "https://freetestapi.com/api/v1/movies")
        
        // Request
        let request = URLRequest(url: url!)
        
        // Session
        let session = URLSession(configuration: .default)
        
        // Task
        let task = session.dataTask(with: request) { data, response, error in
            do{
                let json = try JSONDecoder().decode([Movie].self, from: data!)
                completionHandler(json)
                
            }catch let error  {
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
    
//    func fetchData<T: Codable>(completionHandler: @escaping (Result<T , Error>) -> Void){
//        
//        // URL
//        let url = URL(string: "https://freetestapi.com/api/v1/movies")
//        
//        // Request
//        let request = URLRequest(url: url!)
//        
//        // Session
//        let session = URLSession(configuration: .default)
//        
//        // Task
//        let task = session.dataTask(with: request) { data, response, error in
//            do{
//                let json = try JSONDecoder().decode(T.self, from: data!)
//                completionHandler(json)
//                
//            }catch let error  {
//                print(error.localizedDescription)
//            }
//        }
//        
//        task.resume()
//    }

}
