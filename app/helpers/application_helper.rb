module ApplicationHelper
  def per_day product
    puts DateTime.now
    puts DateTime.now.to_i
    product.alerts.uniq.count/((DateTime.now.to_i - product.created_at.to_i)/1.day)
  end
end
