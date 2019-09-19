class NumbersController < ApplicationController

def index
   @tax_rate = TaxRate.all
   @shipping_fee = ShippingFee.all
end

def new
   @tax_rate = TaxRate.new
   @shipping_fee = ShippingFee.new
 end

 def create
   @tax_rate = TaxRate.new(tax_rate_params)
   @tax_rate.save
   @shipping_fee = ShippingFee.new(shipping_fee_params)
   @shipping_fee.save
   redirect_to numbers_path
 end

 private

   def tax_rate_params
       params.require(:tax_rate).permit(:tax_rate)
   end

   def shipping_fee_params
       params.require(:shipping_fee).permit(:shipping_fee)
   end

 end