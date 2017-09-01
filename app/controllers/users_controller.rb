class UsersController < ApplicationController
	def new
  		@user = User.new
  	end

  	def show
  		#Usuarios dependientes del admin
    	#@user = User.find(params[:id])
      @user = User.find(current_user.id)
      #@all_user = User.where(admin: false)
  	end

    def edit
      p "En EDIT USERRR " * 20
      p @user_edit = User.find(params[:id])
    end

    def registred
      p "jaaaaaaa"
      @all_user = User.where(admin: false)
      if @all_user.count == 1
        p "one user"
        p @one_user = User.find_by(admin: false)
        @all_user = false
      end
      p "all_user"
      p @all_user
    end
    
    def record
      p "info grallll"
      @all_tratment = Treatment.all
    end

    def record_user
      p " un solo USER " * 20
      p params
      p @one_treatment = Treatment.find_by(user_id: params[:id].to_i)
      render 'record'
    end

  	def create
    	@user = User.new(user_params)
    	if @user.save
        last = User.last
        #if exist an admin
        if current_user
          #p User.update(last.id, admin: 0)
          redirect_to index_url
        else
          #p User.update(last.id, admin: 1)
    		  log_in @user
      		flash[:success] = "Welcome to the App!"
      		redirect_to @user
        end
    	else
      		render 'new'
    	end
  	end

    def update
      p "UPdateeee " *20
      p params[:user]
      p params[:id].to_i

      if User.find(params[:id].to_i).email == params[:user][:email]
        p "igual"
        User.update(params[:id].to_i, 
                    name: params[:user][:name],
                    phone_number: params[:user][:phone_number])
      else
        p "no igual"
        User.update(params[:id].to_i, 
                    name: params[:user][:name],
                    phone_number: params[:user][:phone_number],
                    email: params[:user][:email])
      end

      render :controller => 'user', :action => 'registred' 

    end

    def delete
      p "en DELETEEE "
      p params[:id].to_i
      #User.destroy(user_delete)

      user = User.find(params[:id].to_i)

      all_treatment = Treatment.where(user_id: user.id)

      all_treatment.each do |treatment|
        Medicine.find(treatment.medicine_id).destroy
        Event.find(treatment.event_id).destroy
        Reminder.find(treatment.id).destroy
      end
      user.destroy
      
      render :controller => 'users', :action => 'registred'
    end

    def user_params
      params.require(:medicine).permit(:name, :unit_measurement, :presentation_to_take, :dose, :dose_every )
    end

	private

    	def user_params
      		params.require(:user).permit(:name, :email, :phone_number, :password,
                                   :password_confirmation, :admin)
    	end

end
