module GoTransverseTractApi

  module Order

    class InventoryItem

      class << self
        def get_inventory_item inventory_item
          {
            eid: inventory_item[:eid],
            product: inventory_item[:product],
            serialNumber: inventory_item[:serial_number],
            status: inventory_item[:status],
          }
        end
      end

    end

  end

end
