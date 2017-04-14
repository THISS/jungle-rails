class OrderMailer < ApplicationMailer

  def order_email(order)
    @order = Order.find(order.id)
    @user = User.find_by(email: @order.email)
    @items = @order.line_items
    to_with_name = %("#{@user.first_name} #{@user.last_name}" <#{@user.email}>)
    mail(to: to_with_name, subject: "Order number #{order_id} confirmation")
  end

end
