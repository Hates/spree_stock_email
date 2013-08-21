class Spree::StockEmailsController < ApplicationController

  def create
    product = Spree::Product.find_by_id(params[:stock_email][:product])
    redirect_to :back and return unless product

    stock_email = Spree::StockEmail.new
    stock_email.email = spree_current_user ? spree_current_user.email : params[:stock_email][:email]
    stock_email.product = product

    begin
      stock_email.save! unless stock_email.email_exists?
      flash[:success] = "We'll email you when #{product.name} is back in stock!"
    rescue => e
      flash[:notice] = "There was a problem setting up your email alert. Please try again."
    end

    redirect_to :back
  end

end
