class DentistsController < ApplicationController
  def dashboard
    @appointments = Current.dentist.appointments
  end
end
