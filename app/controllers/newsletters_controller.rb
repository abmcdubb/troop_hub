class NewslettersController < ApplicationController
  before_action :set_newsletter, only: [:show]

  def new
    @newsletter = Newsletter.new
    @user = current_user
  end

  def index
    @newsletters = Newsletter.all
  end

  def create
     @newsletter = Newsletter.create(newsletter_params)
    respond_to do |format|
      if @newsletter.save
        format.html { redirect_to "/newsletters/#{@newsletter.id}", notice: 'Troop was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def show
  end
 
private
 def set_newsletter
  @newsletter = Newsletter.find(params[:id])
end

def newsletter_params
  params.require(:newsletter).permit(:item1_title, :item1_desc, :item2_title, :item2_desc, :item3_title, :item3_desc, :note_from_leader, :leader, :troop_id)
end


end
