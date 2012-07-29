class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end
  def show
    id = params[:id]
    @movie = Movie.find(id)
  end
  def new
    
  end
  def create
    @movie = Movie.create!(params[:movie])     
    flash[:notice] = "You have successfully saved your movie!"
    redirect_to movies_path   
  end
  def edit
    @movie = Movie.find(params[:id])
  end
  def update
    @movie = Movie.find(params[:id])
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "You have successfully saved your update to Movie=>#{@movie.title}!"
    redirect_to movie_path(@movie)
  end
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Oh, god! How dare you delete my treasure=>#{@movie.title}!"
    redirect_to movies_path
  end
# add to movies_controller.rb, anywhere inside
#  'class MoviesController < ApplicationController':

  def search_tmdb
    # hardwire to simulate failure
    @movies = Movie.find_in_tmdb(params[:search_terms])
  end  
end
