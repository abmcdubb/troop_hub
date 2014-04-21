class TroopBlogsController < ApplicationController
  before_action :set_troop
  before_action :authenticate_user!, only: [:new]

  def index
    @newsletter = Newsletter.all.last
    @news = TroopBlog.troop_news_feed(params[:id]).paginate(page: params[:page], per_page: 10)
    @sidebar_news = TroopBlog.large_sidebar_news_feed(params[:id])   
  end

  def new
    unless current_user.admin_privileges < 50
      redirect_to(:back)
    end
    @troop_blog = TroopBlog.new
    @troop_blog.troop_id = params[:id]
  end

  def create
    @troop_blog = TroopBlog.new(troop_blog_params)
    respond_to do |format|
      if @troop_blog.save
        format.html { redirect_to "/troops/#{@troop_blog.troop_id}", notice: 'This post has been added to your blog' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def destroy
  end



  private
  def set_troop
    @troop = Troop.find(params[:id])
  end

  def troop_blog_params
    params.require(:troop_blog).permit(:troop_id, :headline, :body, :photo )
  end

  def set_user
    @user = User.find(params[:id])
  end

end