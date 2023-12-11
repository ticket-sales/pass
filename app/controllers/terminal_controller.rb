class TerminalController < ApplicationController

  before_action :set_ticket, only: [:entry, :exit]

  def terminal
  end

  def entry
    number = params[:ticket_number]
    @answer = if check.present?
                check
              elsif !Log.last_action(number)&.entry? 
                Log.create(number: number, action: 'entry')
                'вы вошли'
              else 
                'второй раз пытаешься войти?)))'
              end
   flash[:answer] = @answer
   redirect_to terminal_path 
  end

  def exit
    number = params[:ticket_number]
    @answer = if check.present?
                check
              elsif Log.last_action(number)&.entry? 
                Log.create(number: number, action: 'exit')
                'вы вышли'
              elsif  !Log.last_action(number)&.entry? || !Log.last_action(number).present? 
                'как выходишь, если не заходил'
              end
    flash[:answer] = @answer
    redirect_to terminal_path 
  end
  
  private

  def check
    if @ticket.blank?
      'ticket is not valid'
    elsif @ticket['concert']['event_date'] != Time.now.strftime("%Y-%m-%d")
      'there is no concert today'
    end
  end

  def set_ticket
    @ticket ||= JSON.parse(HTTParty.get("http://web:3000/tickets/find_ticket?number=#{params[:ticket_number]}").body)
  end
end
