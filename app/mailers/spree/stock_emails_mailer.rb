module Spree
  class StockEmailsMailer < ActionMailer::Base
    default from: Spree::StockEmailConfig::Config.email_from

    def stock_email(stock_email)
      @stock_email = stock_email
      mail to: @stock_email.email, subject: Spree.t("stock_email.email.subject")
    end
  end
end
