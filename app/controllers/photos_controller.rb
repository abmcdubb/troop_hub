class PhotosController < ApplicationController
    def create
        if params[:photoable_type] == "troop"
            @troop = Troop.find(params[:photoable_id])
            @photo=Photo.create_from_params(photo_params)
            redirect_to troop_path(@troop)
        elsif params[:photoable_type] == "troop_event"
            @troop_event = TroopEvent.find(params[:photoable_id])
            @photo=Photo.create_from_params(photo_params)
            redirect_to troop_event_path(@troop_event)
        end
    end

  def delete
    @photo = Photo.find(params[:photo_id])
    @photo.destroy
    if params[:page_for_redirect] == "troop"
        @troop = Troop.find(params[:photoable_id])
        redirect_to troop_path(@troop)
    elsif params[:page_for_redirect] == "troop_event"
        @troop_event = TroopEvent.find(params[:photoable_id])
        redirect_to troop_event_path(@troop_event)
    elsif params[:page_for_redirect] == "troop_photo"
        @troop = Troop.find(params[:photoable_id])
        redirect_to troop_photos_path(@troop)
    end
  end

  def individual_troop
    @troop = Troop.find(params[:troop_id])
    @photos = @troop.photos
    @troop_events = @troop.troop_events
  end

    private
    
    def photo_params
        params.require(:photo).permit(:pic, :photoable_id, :photoable_type, :on_page)
    end
end