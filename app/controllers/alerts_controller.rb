class AlertsController < ApplicationController
   before_action :set_alert, only: [:edit, :update, :show, :destory]
   
   def alerts
      @alerts = Alert.all
   end
   
   def new
       @alert = Alert.new
   end
   
   def edit
   end
   
   def create
       @alert = Alert.new(alert_params)
       if @alert.save
           flash[:success] = "Alert was successfully created"
           redirect_to alert_path(@alert)
           else
           render 'new'
       end
   end
   
   def show
   end
   
   def destroy
      @alert = Alert.find(params[:id])
      @alert.destroy
      flash[:danger] = "Alert was successfully deleted"
      redirect_to alerts_path
   end
   
   def update
      if @alert.update(alert_params)
           flash[:success] = "Alert was successfully updated"
           redirect_to alert_path(@alert)
         else
           render 'edit'
         end
   end
   
   private
   def set_alert
      @alert = Alert.find(params[:id])
   end
   
   def alert_params
       params.require(:alert).permit(:title, :issue, :action, :source)
   end
   
   def require_admin
      if current_user != !current_user.admin?
         flash[:danger] = "You can only create, edit or delete alerts if you are an admin"
         redirect_to root_path
      end
   end
      
end