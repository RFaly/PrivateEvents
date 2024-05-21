class EventsController < ApplicationController
  before_action :set_event, except: [:index, :new, :create]

  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def index
    @past_events = Event.past
    @upcoming_events = Event.upcoming
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to @event, notice: 'Event created successfully.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: 'Event deleted successfully.'
  end

  def attend
    if @event.attendees.include?(current_user)
      redirect_to @event, alert: 'You are already attending this event.'
    else
      @event.attendees << current_user
      redirect_to @event, notice: 'Registered successfully for the event.'
    end
  end

  def unattend
    attendance = EventAttendance.find_by(attendee: current_user, attended_event: @event)
    if attendance
      attendance.destroy
      redirect_to @event, notice: 'Unregistered successfully  from the event.'
    else
      redirect_to @event, alert: 'You are not registered for this event.'
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def authorize_user!
    redirect_to events_path, alert: 'Not authorized' unless @event.creator == current_user
  end

  def event_params
    params.require(:event).permit(:title, :date, :location)
  end
end
