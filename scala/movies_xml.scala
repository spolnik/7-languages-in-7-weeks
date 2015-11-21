val movies =
  <movies>
    <movie genre="action">Pirates of the Caribbean</movie>
    <movie genre="fairytale">Edward Scissorhands</movie>
    <short>Jack Jack Attack</short>
    <short>Geri's Game </short>
  </movies>

println(movies.text)

val movieNodes = movies \ "movie"

println(movieNodes(0))
println(movieNodes(0) \ "@genre")

println("All movies: ")

(movies \ "_").foreach { movie =>
  movie match {
    case <movie>{movieName}</movie> => println(movieName)
    case <short>{shortName}</short> => println(shortName + " (short)")
  }
}
