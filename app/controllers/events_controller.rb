class EventsController < ApplicationController
  
  def event_params
    valid = params.require(:event).permit(:id,:title,:description,:start_date) 

    date_format = "%m/%d/%Y %I:%M %p"
    offset = DateTime.now.strftime("%z")
    valid[:start_date] = valid[:start_date] != "" ? DateTime.strptime(valid[:start_date], date_format).change(:offset => offset).to_s : valid[:start_date]
    return valid
  end
end
