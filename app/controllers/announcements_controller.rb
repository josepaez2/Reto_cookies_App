class AnnouncementsController < ApplicationController
  
  def index
    @announcements = Announcement.all
    @current_user = current_user
  end
  def show
    @announcement = Announcement.find(params[:id])
  end
  def new
    @announcement = Announcement.new
  end
  def create
    @user = current_user
    # @announcement = Announcement.new(announcement_params)
    @user.announcements.create(announcement_params)
    # if @user.announcements.save
      # log_in @user
      # redirect_to @user
      redirect_to action: "index", id: 5
      flash.now[:success] = "Your announcement was published successfully!"
  end

  # def destroy
  #   @room = Room.find(params[:id])
  #   @room.destroy
  #   redirect_to rooms_path
  # end
  
  # private

  def announcement_params
    params.require(:announcement).permit(:content, :expiration_date, :seen_state)
  end

end
