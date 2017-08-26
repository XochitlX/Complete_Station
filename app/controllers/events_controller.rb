class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.where(start: params[:start]..params[:end])
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    p "CREATEE " * 20
    @event = Event.new(event_params)
    @event.save
    
    h = 8
    m = 5
    date = Event.last

    p t_start = date.start#.strftime('%Y-%m-%d %I:%M')
    p t_end = date.end#.strftime('%Y-%m-%d')

    time_control = ""
    time_control2 = []                                #minuteeeeee m.minute h.hour
    (t_start.to_time.to_i .. t_end.to_time.to_i).step(m.minute) do |date|
      puts time_control << date.to_s#.strftime('%Y-%m-%d %I:%M %p')
      puts time_control2 << Time.at(date)#.strftime('%Y-%m-%d %I:%M %p')
    end
    p time_control
    p time_control2
    Reminder.create(user_id: 1, control: time_control, control_missing: time_control)


  end

  def update
    p "Cambianddoooo" *20
    p params
    p @event.update(event_params)
    p event_change_id = params[:id]
    h = 8
    m = 5
    p date = Event.find(event_change_id)

    p t_start = date.start#.strftime('%Y-%m-%d %I:%M')
    p t_end = date.end#.strftime('%Y-%m-%d')

    p "a guardarrrr"
    time_control = ""
    time_control2 = []
    (t_start.to_time.to_i .. t_end.to_time.to_i).step(m.minute) do |date|
      puts time_control << date.to_s#.strftime('%Y-%m-%d %I:%M %p')
      puts time_control2 << Time.at(date)#.strftime('%Y-%m-%d %I:%M %p')
    end
    p time_control
    p time_control2
    Reminder.create(user_id: 1, control: time_control, control_missing: time_control)

  end

  def destroy
    @event.destroy
    #Destruir el reminder¡¡
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :date_range, :start, :end, :color)
    end
end
