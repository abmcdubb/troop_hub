class PhotosController < ApplicationController
    def create
        if params[:photoable_type] == "troop"
            @troop = Troop.find(params[:photoable_id])
            @photo=Photo.create_from_params(photo_params)
            redirect_to troop_path(@troop)
        end
    end

  def delete
    @photo = Photo.find(params[:photo_id])
    @photo.destroy
    if params[:photoable_type] == "troop"
        @troop = Troop.find(params[:photoable_id])
        redirect_to troop_path(@troop)
    end
  end

    private
    
    def photo_params
        params.require(:photo).permit(:pic, :photoable_id, :photoable_type, :on_page)
    end
end