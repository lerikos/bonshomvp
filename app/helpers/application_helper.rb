module ApplicationHelper
  def per_day product
    ago = (DateTime.now.to_i - product.created_at.to_i)/1.day
    product.alerts.uniq.count/(ago == 0 ? 1 : ago)
  end
end
