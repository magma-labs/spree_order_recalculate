require 'spec_helper'

describe Spree::Order do
  describe '#update_with_line_items!' do
    it 'updates order total when variant price updated' do
      variant   = create(:variant, price: 1000)
      line_item = create(:line_item, variant: variant, price: variant.price)
      order     = create(:order, line_items: [line_item])

      variant.price = 10
      variant.save

      order.update_with_line_items!
      order.reload

      expect(order.total).to eq variant.price
    end
  end
end
