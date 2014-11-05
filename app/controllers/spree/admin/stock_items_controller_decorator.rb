Spree::Admin::StockItemsController.class_eval do

  before_filter :set_current_on_hand_value, only: :create
  after_filter :send_stock_emails, only: :create

  def set_current_on_hand_value
    @variant = Spree::Variant.find(params[:variant_id])
    @had_no_stock = !@variant.in_stock?
  end

  def send_stock_emails
    Spree::StockEmail.notify(@variant.product) if @had_no_stock && @variant.in_stock?
  end

end
