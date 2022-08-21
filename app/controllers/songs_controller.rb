class SongsController < ApplicationController
    def show
        @song = Song.find(params[:id])
    end

    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def edit
        @song = Song.find(params[:id])
    end
    

    def create
        @song = Song.new(params.require(:song).permit(:title, :description))
        if @song.save
          flash[:notice] = "Song was created successfully"
          redirect_to @song 
        else
          render 'new'
        end
    end

    def update
        @song = Song.find(params[:id])
        if @song.update(params.require(:song).permit(:title, :description))
            flash[:notice] = "Song was updated successfully"
            redirect_to @song 
        else
            render 'edit'
        end 
    end

    def destroy
        @song = Song.find(params[:id])
        @song.destroy
        redirect_to songs_path
    end
    
    
    
    
end