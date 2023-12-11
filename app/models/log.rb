class Log < ApplicationRecord

  def self.last_action(number)
    where(number: number).order(created_at: :desc).first
  end

  def entry?
    action == 'entry'
  end
end
