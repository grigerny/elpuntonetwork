class CalendarsController < ApplicationController	
  before_filter :authenticate_user!
  def index
    @home_index  = true
  end
end
