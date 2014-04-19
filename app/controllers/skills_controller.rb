class SkillsController < ApplicationController

  def show
    @event = Event.new
    @skills = Skill.all
    @age_levels = AgeLevel.all
    @badges = Badge.all
    @news = TroopBlog.homepage_news_feed
    @events = Event.where(:skill_id => params[:id])
  end

  def category_index
    @event = Event.new
    @skills = Skill.all
    @age_levels = AgeLevel.all
    @badges = Badge.all
    @news = TroopBlog.homepage_news_feed
    @events = Event.find_by_skill_category(params[:id])
  end
end