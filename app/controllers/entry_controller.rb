class EntryController < ApplicationController
  def check
    response = HTTParty.get("http://web:3000/tickets/find_ticket?number=#{params[:ticket_number]}")
    # byebug
    if JSON.parse(response.body).blank?
      @answer = 'ticket is not valid'
    else 
      @answer = 'ticket is valid'
    end
    flash[:answer] = @answer
    redirect_to entry_path 
  end
end
