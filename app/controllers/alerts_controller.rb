class AlertsController < ApplicationController
   def alertlist
      @alerts = Alert.all
   end
   
   def new
       @alert = Alert.new
   end
   
   def edit
      @alert = Alert.find(params[:id])
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
   
   def update
      @alert = Alert.find(params[:id])
      if @alert.update(alert_params)
           flash[:notice] = "Alert was successfully updated"
           redirect_to alert_path(@alert)
         else
           render 'edit'
         end
   end
   
   private
   def alert_params
       params.require(:alert).permit(:title, :issue, :action, :source)
   end
end