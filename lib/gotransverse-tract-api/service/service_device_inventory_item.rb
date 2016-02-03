module GoTransverseTractApi

  module Service

    class ServiceDeviceInventoryItem

      class << self

        #
        # @param {Long} eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def self.find_by_eid eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {eid: eid, queryScope: query_scope})
        end

        #
        # @param {Long} product_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_product_eid product_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {product_eid: product_eid, queryScope: query_scope})
        end

        #
        # @param {String} status
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_status status, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {status: status, queryScope: query_scope})
        end

        #
        # @param {Long} serial_number
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def self.find_by_serial_number serial_number, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {serial_number: serial_number, queryScope: query_scope})
        end

      end

    end

  end

end
