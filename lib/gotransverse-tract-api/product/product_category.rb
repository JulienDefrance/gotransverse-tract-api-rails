module GoTransverseTractApi

  module Product

    class ProductCategory < DiscountCategory
      def self.get_product_category(product_category)
        product_category = {
          name: product_category[:name],
          description: product_category[:description],
          status: product_category[:status],
          eid: product_category[:eid]
        }

        product_category
      end
    end

  end

end
