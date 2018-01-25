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
      redirect_to action: "index"
      flash[:success] = "Your announcement was published successfully!"
    else
      # flash[:danger] = "Your announcement is more than 140 characters, please try making it shorter"
      redirect_to new_announcement_path(@announcement)
      flash[:danger] = "Your announcement is more than 140 characters, please try making it shorter"
    end
  end

  def destroy
    @announcement = Announcement.find(params[:id])
    @announcement.destroy
    redirect_to root_path
  end
  
  # private

  def announcement_params
    params.require(:announcement).permit(:content, :expiration_date, :seen_state)
  end

end
