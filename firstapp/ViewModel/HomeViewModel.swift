//
//  HomeViewModel.swift
//  firstapp
//
//  Created by Shobhakar Tiwari on 2/3/26.
//

class HomeViewModel {
    private var movies: [Movie] = []
    
    // MARK: Helper Methods
    
    func loadMovies() {
        let objMovie1 = Movie(name: "F1", description: "F1 is without a doubt Brad Pitt’s greatest movie so far, showcasing his remarkable talent and versatility as an actor. The film delivers everything a truly great movie should have—from a gripping and well-paced story to complex characters, intense emotional moments, and breathtaking visuals. Every scene is crafted with precision, balancing action, drama, and subtle humor, making it an unforgettable cinematic experience. With its compelling plot, outstanding performances, and seamless direction, F1 stands out as a complete package that not only entertains but also leaves a lasting impression on the audience.", releaseDate: "12/11/2025", posterImage: "text.page.fill")
        movies.append(objMovie1)
        
        let objMovie2 = Movie(name: "F2", description: "F2 stands as Brad Pitt’s greatest movie to date, showcasing his finest performance while offering a perfect balance of action, emotion, and compelling storytelling. The film excels in every aspect, from its gripping plot and strong character development to its breathtaking visuals and memorable soundtrack, making it a complete cinematic experience.", releaseDate: "12/11/2025", posterImage: "text.page.fill")
        movies.append(objMovie2)
    }
    
    func numberOfMovies() -> Int {
        return movies.count
    }
    
    func movie(at index: Int) -> Movie {
        return movies[index]
    }
}
