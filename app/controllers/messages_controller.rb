class MessagesController < ApplicationController
	before_action :authenticate_user!, except:[:new]
	before_action :set_message, only: [:show, :edit, :update, :destroy]

	def new
		@message = Message.new(order_id: params[:order_id]) #@order.messages.build	
	end

	def create
	    @message = Message.new(message_params)
	  
	    respond_to do |format|
	      if @message.save
	        format.html { redirect_to order_path(@message.order_id), notice: t('.notice') }
	        format.json { render :show, status: :created, location: @message }
	      else
	        format.html { render :new }
	        format.json { render json: @message.errors, status: :unprocessable_entity }
	      end
	    end
	 end

	private
  
    def set_message
      @message = Message.find_by(id: params[:id])
    end

    def message_params
      params.require(:message).permit(:email, :name, :text, :order_id)
    end
end
