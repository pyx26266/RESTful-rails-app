class PhotosController < ApplicationController
  
  def index
    
  end
  
  def new
    
  end
  
  def create
    @photo = current_user.build_photo(photo_params)
    randomize_file_name
    puts "writing log"
    puts @photo.image_file_name
    if @photo.save
      flash[:success] = "upload done"
      redirect_to current_user
    else
      render json: 'Something wrong'
    end
  end
  
  private

  def randomize_file_name
    ext = File.extname(@photo.image_file_name).downcase
    @photo.image_file_name = SecureRandom.urlsafe_base64+ext
  end
  def photo_params
    params.require(:photo).permit(:title, :image)
  end
end
