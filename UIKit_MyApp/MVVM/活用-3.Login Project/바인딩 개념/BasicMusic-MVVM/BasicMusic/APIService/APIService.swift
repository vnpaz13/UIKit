
import Foundation
import UIKit

// 싱글톤으로 구현
final class APIService {
    static let shared = APIService()
    
    func fetchMusic(completion: @escaping (Result<[Music], NetworkError>) -> Void) {
        let urlString = "https://itunes.apple.com/search?media=music&term=aespa"
        let url = URL(string: urlString)!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                completion(.failure(.networkingError))
                return
            }
            
            guard let safeData = data else {
                completion(.failure(.dataError))
                return
            }
            
            do {
                let musicData = try JSONDecoder().decode(MusicData.self, from: safeData)
                completion(.success(musicData.results))
            } catch {
                completion(.failure(.parseError))
            }
        }.resume()
    }

}
