require 'aerospike_c_ruby'
require 'active_support'


module ActiveSupport
  module Cache
    class AerospikeCRubyStore < Store

    AEROSPIKE_DEFAULT_OPTIONS = {
      :host => '127.0.0.1',
      :port => 3000,
      :ns   => 'test',
      :set  => 'cache',
      :bin  => 'entry',
    }

    ##
    ## @brief      Init
    ##
    ## @param      options  Options (default: { }).
    ##
    ##
    def initialize(options = {})
      merge_options(options)
      @client = options.delete(:client) || AerospikeC::Client.new(options.delete(:host), options.delete(:port))
      super
    end


    ##
    ## protected
    ##
    protected
      def internal_read_entry(key, options)
        record = @client.get(as_key(key, options))

        if record
          record[options[:bin]]
        else
          nil
        end
      end

      def read_entry(key, options)
        if value = internal_read_entry(key, options)
          value = ActiveSupport::Cache::Entry.new(value)
        else
          nil
        end
      end

      def write_entry(key, entry, options)
        options[:ttl] ||= options[:expires_in] if options[:expires_in]

        value = entry.value

        @client.put(as_key(key, options), {options[:bin] => value}, options)
      end

      def delete_entry(key, options)
        @client.delete(as_key(key, options))
      end

    ##
    ## private
    ##
    private
      def as_key(key, options)
        AerospikeC::Key.new(options[:ns], options[:set], key)
      end

      def merge_options(options)
        options.merge!(self.class::AEROSPIKE_DEFAULT_OPTIONS) { |key, v1, v2| v1 }
      end

    end
  end
end