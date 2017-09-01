class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    #@events = Event.where(start: params[:start]..params[:end])
    if current_user.admin
      @events = Event.where(start: params[:start]..params[:end])
    else
      user_treatment = Treatment.where(user_id: current_user.id)
      events =  []
      user_treatment.each do |treatment|
        events << Event.find(treatment.event_id)
      end
      @events = events
    end
    @events
  end

  def show
  end

  def new
    @event = Event.new
    # @total_users = []
    # User.all.each { |user| @total_users << user.name }
    # p @total_users
  end

  def edit
    @admin = current_user.admin
    p "GGGGGGGGGGGG"
    p params
    p @event_info = params[:id].to_i
    p @treatment_info = Treatment.find_by(event_id: @event_info)
    #@event_info =  params[:id].to_i
  end

  def create
    p "CREATEE " * 20
    p current_user.name
    
    #@event = Event.new(event_params)
    #@event.save


    m = 0
    params[:new_event].each do |key, value|
      if value == "" || value == "Invalid date"
        m = 1
      end
    end
     p "condicion"
     p m

    

    if m == 0

##################################################################
    p @event = Event.create(title: params[:new_event][:title],
                          start: params[:new_event][:start], 
                          end: params[:new_event][:end], 
                          color: params[:new_event][:color])
    
    #Data medicine
    medicine_name = params[:new_event][:medicine_name]
    unit_measurement = params[:new_event][:unit_measurement]
    presentation_to_take = params[:new_event][:presentation_to_take]
    dose = params[:new_event][:dose].to_i
    h = params[:new_event][:dose_every].to_i
    
    p new_medicine = Medicine.create(name: medicine_name,
                    unit_measurement: unit_measurement,
                    presentation_to_take: presentation_to_take,
                    dose: dose, dose_every: h)

    #Treatment
    p "treatment"
    p current_user.id
    p new_medicine.id
    p @event.id
    p treatment = Treatment.create(user_id: current_user.id, medicine_id: new_medicine.id, event_id: @event.id)
    

    #Reminderrrr
    p "reminder"
    p t_start = @event.start#.strftime('%Y-%m-%d %I:%M')
    p t_end = @event.end#.strftime('%Y-%m-%d')

    time_control = ""
    time_control2 = []                              #minuteeeeee m.minute h.hour
    time_control3 = []
    time_control_t = ""
    (t_start.to_time.to_i .. t_end.to_time.to_i).step(h.minute) do |date|
      time_control << date.to_s#.strftime('%Y-%m-%d %I:%M %p')
      time_control2 << Time.at(date)#.strftime('%Y-%m-%d %I:%M %p')
      time_control3 << Time.at(date) if Time.at(date) >= Time.now
      time_control_t << date.to_s if Time.at(date) >= Time.now
    end
    # p "primero"
    # p time_control
    # p "segundo"
    # p time_control2
    p "tercero"
    p time_control3
    Reminder.create(treatment_id: treatment.id, control: time_control, control_missing: time_control_t)

##################################################################

    else
      p "flasshhhhj"
      flash.now[:danger] = 'Invalid all'
      #flash[:error] = 'Invalid all'

      #render 'new'
      render :controller => 'visitors', :action => 'index'
    end

  end



  def toedit
    redirect_to action: "update"
  end

  def update
    # p @event.update(event_params)
    p "Cambianddoooo" *20
    p params
    
    
  m = 0
    params[:new_event].each do |key, value|
      if value == "" || value == "Invalid date"
        m = 1
      end
    end
     p "condicion"
     p m

    

    if m == 0
###################################################################
    p @event.update(title: params[:new_event][:title],
                    start: params[:new_event][:start], 
                    end: params[:new_event][:end], 
                    color: params[:new_event][:color])
    
    #Treatment
    p treatment = Treatment.find_by(event_id: @event.id)


    #Data medicine
    p medicine = Medicine.find(treatment.medicine_id)

    medicine_name = params[:new_event][:medicine_name]
    unit_measurement = params[:new_event][:unit_measurement]
    presentation_to_take = params[:new_event][:presentation_to_take]
    dose = params[:new_event][:dose].to_i
    h = params[:new_event][:dose_every].to_i
    
    p medicine.update(name: medicine_name,
                      unit_measurement: unit_measurement,
                      presentation_to_take: presentation_to_take,
                      dose: dose, dose_every: h)

    
    #Reminderrrr
    m = 5
    p date = Event.find(treatment.event_id)

    p t_start = date.start#.strftime('%Y-%m-%d %I:%M')
    p t_end = date.end#.strftime('%Y-%m-%d')

    time_control = ""
    time_control2 = []                              #minuteeeeee m.minute h.hour
    time_control3 = []
    time_control_t = ""
    (t_start.to_time.to_i .. t_end.to_time.to_i).step(h.minute) do |date|
      time_control << date.to_s#.strftime('%Y-%m-%d %I:%M %p')
      time_control2 << Time.at(date)#.strftime('%Y-%m-%d %I:%M %p')
      time_control3 << Time.at(date) if Time.at(date) >= Time.now
      time_control_t << date.to_s if Time.at(date) >= Time.now
    end
    # p "primero"
    # p time_control
    # p "segundo"
    # p time_control2
    # p "tercero"
    p time_control3
    Reminder.update(treatment_id: treatment.id, control: time_control, control_missing: time_control_t)

##################################################################
  else
      p "flasshhhhj"
      flash.now[:danger] = 'Invalid all'
      #flash[:error] = 'Invalid all'

      #render 'new'
      render :controller => 'visitors', :action => 'index'
    end

  end

  def destroy
    p "Destrooyyy " * 20
    #@event.destroy
    event_eliminate = @event.id
    treatment = Treatment.find_by(event_id: event_eliminate)
    medicine = Medicine.find(treatment.medicine_id)
    reminder = Reminder.find_by(treatment_id: treatment.id)

    @event.destroy
    treatment.destroy
    medicine.destroy
    reminder.destroy
    
  end

  def eliminate
    p "para Eliminarrrrr "
    p treatment_id = params[:id]
    
    p treatment = Treatment.find(params[:id])
    p Medicine.find(treatment.medicine_id).destroy
    p Event.find(treatment.event_id).destroy
    p Reminder.find(treatment.id).destroy
    #treatment.destroy

    #render :controller => 'user', :action => 'registred' 
    redirect_to :controller => 'user', :action => 'registred'
  end


  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :date_range, :start, :end, :color)
    end
end
