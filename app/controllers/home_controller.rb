class HomeController < ApplicationController
before_action :set_appointment, only: [:show, :edit, :update, :destroy]

    def index
        @user = Current.user
        @dentist = Current.dentist
        if @user
            @appointments = @user.appointments
        elsif @dentist
            @appointments = @dentist.appointments.by_dentist(@dentist)
        else
            @appointments = Appointment.all 
        end
        filter_options
    end

    def show
    end

    def new
        if @user
            @appointment = @user.appointments.build
        elsif @dentist
            @appointment = @dentist.appointments.build
        else
            @appointment = Appointment.new
        end
    end



    def create
        Rails.logger.info "Creating appointment with params: #{appointment_params.inspect}"
        @appointment = Appointment.new(appointment_params)
        @appointment.user_id = Current.user.id 

        if @appointment.save
            redirect_to appointment_path(@appointment)
        else
            render :edit, status: :unprocessable_entity
        end
    end



    def edit
    end

    def update
        if @appointment.update(appointment_params)
            redirect_to appointment_path(@appointment)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @appointment.destroy
        redirect_to root_path
    end

    def login
        flash[:notice] = "Logged In Succesfully"
        flash[:alert] = "Invalid Authentication"
    end

    def approve
      @appointment = Appointment.find(params[:id])
      @appointment.update(status: "approved")
      redirect_to appointment_path(@appointment)
    end

    def cancel
      @appointment = Appointment.find(params[:id])
      @appointment.update(status: "cancelled")
      redirect_to appointment_path(@appointment)
    end


    private

    def set_appointment
        if Current.user
            @appointment = Current.user.appointments.find(params[:id])
        elsif Current.dentist
            @appointment = Current.dentist.appointments.find(params[:id])
        else
            @appointment = Appointment.find(params[:id])
        end
    end


    def filter_options
        if params[:filter_by_time] == "upcoming"
            @appointments = @appointments.upcoming
        elsif params[:filter_by_time] == "past"
            @appointments = @appointments.past
        end
        if params[:sort] == "most_recent"
            @appointments = @appointments.most_recent
        elsif params[:sort] == "longest_ago"
            @appointments = @appointments.longest_ago
        end
    end


    def appointment_params
        params.require(:appointment).permit(:branch, :start_time, :end_time, :dentist_id, :user_id, :service, :status)

    end

end