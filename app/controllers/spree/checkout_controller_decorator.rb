module Spree
  CheckoutController.class_eval do
    include OrderRecalculate
    before_action :recalculate_order, only: [:edit]
    before_action :test

    def test
      binding.pry
    end
  end
end
