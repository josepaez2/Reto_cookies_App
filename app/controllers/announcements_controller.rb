class AnnouncementsController < ApplicationController
  
  def index
    if current_user
      @announcements = Announcement.where.not(id: cookies.signed[:announcement_id])
      # @announcements = Announcement.unread_by(current_user)
      @current_user = current_user
    end
  end
  # def show
  #   @announcement = Announcement.find(params[:id])
  # end
  # def read
  #   @announcement = Announcement.find(params[:id])
  #   @announcement.mark_as_read! for: current_user
  #   redirect_to :root
  #   # render :index
  # end
  def read
    cookies.signed[:announcement_id] ||= []
    announcements = cookies.signed[:announcement_id]
    announcements = announcements & announcements
    announcement = Announcement.find(params[:id])
    announcements << announcement.id
    cookies.permanent.signed[:announcement_id] = announcements
    redirect_to :root
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

  # def destroy
  #   @announcement = Announcement.find(params[:id])
  #   # @announcement.destroy
  #   @announcement.update_attributes(seen_state: true)
  #   redirect_to root_path
  # end
  def history
      @announcements = Announcement.where(id: cookies.signed[:announcement_id])
    # @announcements = Announcement.read_by(current_user)
    @current_user = current_user
    render :history
  end
  
  # private

  def announcement_params
    params.require(:announcement).permit(:content, :expiration_date, :seen_state)
  end

end
