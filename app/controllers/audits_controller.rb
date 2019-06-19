class AuditsController < ApplicationController
  before_action :authenticate_user!
  def show
    @story_changes = Story.find(params[:id]).versions
    render '/audits/show'
  end
 
end
