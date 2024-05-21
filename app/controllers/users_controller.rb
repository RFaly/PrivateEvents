class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show

  def show
    redirect_to events_path, alert: 'Not authorized' unless params[:id].to_i == current_user.id

    @user = User.find(params[:id])
    @created_events = @user.created_events
    @attended_events = @user.attended_events
  end
end
