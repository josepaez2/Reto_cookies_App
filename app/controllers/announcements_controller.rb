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
    @announcement = @user.announcements.new(announcement_params)
    # @user.announcements.create(announcement_params)
    if @announcement.save
      redirect_to action: "index", notice: "Your announcement was published successfully!"
      # flash.now[:success] = "Your announcement was published successfully!"
    else
      redirect_to new_announcement_path(@announcement), danger: "Invalid announcement, your announcement is more than 140 characters, please try making it shorter"
      # flash.now[:danger] = "Your announcement is more than 140 characters, please try making it shorter"
    end
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
