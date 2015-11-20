module GoTransverseTractApi

  module Service

    class ServiceDeviceInventoryItem

      class << self

        #
        # @param {Long} eid
        #
        def self.find_by_eid eid
          GoTransverseTractApi.get_response_for(self, {eid: eid})
        end

        #
        # @param {Long} product_eid
        #
        def find_by_product_eid product_eid
          GoTransverseTractApi.get_response_for(self, {product_eid: product_eid})
        end

        #
        # @param {String} status
        #
        def find_by_status status
          GoTransverseTractApi.get_response_for(self, {status: status})
        end

        #
        # @param {Long} serial_number
        #
        def self.find_by_serial_number serial_number
          GoTransverseTractApi.get_response_for(self, {serial_number: serial_number})
        end

      end

    end

  end

end
