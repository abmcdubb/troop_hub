class PhotosController < ApplicationController
    def create
        if params[:photoable_type] == "troop"
            @troop = Troop.find(params[:photoable_id])
            @photo = Photo.create(pic: params[:photo], photoable_id: params[:photoable_id], photoable_type: params[:photoable_type].camelize)
            redirect_to troop_path(@troop)
        end
    end
end