require 'open-uri'
require 'json'

puts "Cleaning database..."
Bookmark.destroy_all
List.destroy_all
Movie.destroy_all

puts "Fetching top rated movies from TMDB..."
(1..5).each do |page|
  url = "https://tmdb.lewagon.com/movie/top_rated?page=#{page}"
  response = URI.open(url).read
  data = JSON.parse(response)

  data["results"].each do |movie_data|
    Movie.create!(
      title:      movie_data["title"],
      overview:   movie_data["overview"],
      poster_url: "https://image.tmdb.org/t/p/w500#{movie_data["poster_path"]}",
      rating:     movie_data["vote_average"]
    )
  end
end

puts "Creating sample lists..."
List.create!(name: "My Favorites")
List.create!(name: "Watch Later")
List.create!(name: "Classics")

puts "Finished! Created #{Movie.count} movies and #{List.count} lists."
