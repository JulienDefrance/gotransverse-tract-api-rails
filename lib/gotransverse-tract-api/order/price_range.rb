module GoTransverseTractApi

  module Order

    class PriceRange

      class << self
        def get_price_ranges(price_ranges)
          priceRanges = {
            attributes: {},
            priceRange: {
              quantityBeginRange: price_ranges[:price_range][:quantity_begin_range],
              quantityEndRange: price_ranges[:price_range][:quantity_end_range],
              price: price_ranges[:price_range][:price],
              level: price_ranges[:price_range][:level],
              currencyType: price_ranges[:price_range][:currency_type],
              eid: price_ranges[:price_range][:eid]
            }
          }

          priceRanges
        end
      end

    end

  end

end
