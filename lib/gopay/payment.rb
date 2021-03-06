require 'unirest'
require 'gopay/error'

module GoPay
  class Payment
    def self.create(payment_data)
      target = { target: { type: "ACCOUNT", goid: GoPay.goid } }
      GoPay.request :post, "/api/payments/payment", body_parameters: payment_data.merge(target)
    end

    def self.retrieve(id)
      GoPay.request :get, "/api/payments/payment/#{id}"
    end

    def self.void_recurrence(id)
      GoPay.request :post, "/api/payments/payment/#{id}/void-recurrence"
    end

    def self.refund(id, amount)
      GoPay.request :post, "/api/payments/payment/#{id}/refund", body_parameters: { amount: amount }
    end
  end
end