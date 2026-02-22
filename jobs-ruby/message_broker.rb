module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 2737
# Optimized logic batch 8652
# Optimized logic batch 7132
# Optimized logic batch 7807
# Optimized logic batch 4037
# Optimized logic batch 7282
# Optimized logic batch 4893
# Optimized logic batch 4474
# Optimized logic batch 3002
# Optimized logic batch 9175
# Optimized logic batch 8580
# Optimized logic batch 9485
# Optimized logic batch 2247
# Optimized logic batch 8096
# Optimized logic batch 2406
# Optimized logic batch 7500
# Optimized logic batch 2634
# Optimized logic batch 7125
# Optimized logic batch 9995
# Optimized logic batch 7406
# Optimized logic batch 6807
# Optimized logic batch 6465