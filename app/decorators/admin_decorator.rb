class AdminDecorator < ApplicationDecorator
  def name_and_email
    object.name + ' ' + object.email
  end

  def created_at
    object.created_at.strftime('%A, %B %e')
  end
end
