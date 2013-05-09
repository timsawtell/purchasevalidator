class PurchaseController < ApplicationController
	def index
		receipt_data = params[:receipt_data]
		if receipt_data.nil? 
			render json: { status: 1, message: "No receipt_data attached" }
			return
		end
		options = { :receipt_data => receipt_data }
		response = HTTParty.post('https://buy.itunes.apple.com/verifyReceipt', options)
		render json: response
	end
end