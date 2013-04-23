class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @all_ratings = Movie.MPAA_ratings
    #session[:sort] = params[:sort]
    logger.debug(params)
    if params[:ratings].nil?
      if session[:ratings].nil? || params[:load_all]
        session[:ratings] = Hash.new
        @all_ratings.each do |rating|
          session[:ratings][rating] = 1
        end
      end
    else
      session[:ratings] = params[:ratings]
    end
    @ratings = session[:ratings]
    if params[:sort].nil?
      session[:sort] = "id"
    else
      session[:sort] = params[:sort]
    end
    if params[:sort].nil? || params[:ratings].nil?
      flash.keep
      redirect_to movies_path(:sort => session[:sort], :ratings => session[:ratings])
    end
    @movies = Movie.order(session[:sort]).where(:rating => session[:ratings].keys).all
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
