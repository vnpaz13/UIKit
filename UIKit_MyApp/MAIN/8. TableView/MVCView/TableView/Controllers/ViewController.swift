
import UIKit

class ViewController: UIViewController {
 
//    var moviesArray: [Movie] = [] // 빈 배열로 만들어 놓기
    
    var movieDataManager = DataManager()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.rowHeight = 120
        
        tableView.delegate = self
 
        title = "영화목록"
        
        movieDataManager.makeMovieData()
//        moviesArray = movieDataManager.getMovieData()
    }

    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        
        movieDataManager.updateMovieData()
        
        tableView.reloadData()
    }
    
// UITableViewDataSource 코드를 걍 여기에 넣어도 된다. extension 제거 후 class 속성에 재입력
}

extension ViewController:  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return movieDataManager.getMovieData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell

        let array = movieDataManager.getMovieData()
      
        let movie = array[indexPath.row]
        
        cell.mainImageView.image = movie.movieImage
        cell.movieNameLabel.text = movie.movieName
        cell.descriptionLabel.text = movie.movieDescription
        cell.selectionStyle = .none
        
        return cell
        
//      return UITableViewCell()
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "toDetail", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let detailVC = segue.destination as! DetailViewController
                
            let array = movieDataManager.getMovieData()
            
            let indexPath = sender as! IndexPath
            
            detailVC.movieData = array[indexPath.row]
            
        }
    }
}
