class AppointmentsController < ApplicationController
	def approve
	  @appointment = Appointment.find(params[:id])
	  @appointment.update(status: "approved")
	  redirect_to dashboard_dentists_path, notice: 'Appointment approved!'
	end

	def cancel
	  @appointment = Appointment.find(params[:id])
	  @appointment.update(status: "cancelled")
	  redirect_to dashboard_dentists_path, notice: 'Appointment cancelled!'
	end
end
