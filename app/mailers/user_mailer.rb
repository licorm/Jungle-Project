class UserMailer < ApplicationMailer
  def user_email(order)
    @order = order
    mail(to: @order.email, subject: @order.id)
  end
end
