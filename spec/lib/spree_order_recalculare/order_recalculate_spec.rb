require 'spec_helper'

describe OrderRecalculate do
  describe '.recalculate_order' do
    it 'updates current_order total amount if variant price changes' do
      variant   = create(:variant, price: 1000)
      line_item = create(:line_item, variant: variant, price: variant.price)
      order     = create(:order, line_items: [line_item])

      variant.price = 10
      variant.save

      allow_any_instance_of(described_class).to receive(:current_order).and_return(order)
      described_class.recalculate_order

      expect(order.total).to eq variant.price
    end
  end
end
