class AlertsController < ApplicationController
   def new
       @alert = Alert.new
   end
   
   def create
       @alert = Alert.new(alert_params)
       if @alert.save
           flash[:notice] = "Alert was successfully created"
           redirect_to alert_path(@alert)
           else
           render 'new'
       end
   end
   
   def show
      @alert = Alert.find(params[:id]) 
   end
   
   private
   def alert_params
       params.require(:alert).permit(:title, :issue, :action, :source)
   end
end