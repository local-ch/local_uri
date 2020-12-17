require 'rack/utils'
require 'active_support/core_ext/hash/indifferent_access'

module LocalUri
  class Query

    delegate :[], :dig, to: :parsed_query

    def initialize(uri)
      @uri = uri
    end

    def to_s
      @uri.query_string
    end

    def merge(*args, &block)
      @uri.dup.tap do |uri|
        uri.query_string = build_query_string(parsed_query.merge(*args, &block))
      end
    end

    def merge!(*args, &block)
      @uri.tap do |uri|
        uri.query_string = build_query_string(parsed_query.merge(*args, &block))
      end
    end

    def except(*args, &block)
      @uri.dup.tap do |uri|
        uri.query_string = build_query_string(parsed_query.except(*args, &block))
      end
    end

    def except!(*args, &block)
      @uri.tap do |uri|
        uri.query_string = build_query_string(parsed_query.except(*args, &block))
      end
    end

    private

    def parsed_query
      Rack::Utils.parse_nested_query(@uri.query_string).with_indifferent_access
    end

    def build_query_string(query)
      query_string = Rack::Utils.build_nested_query(query)
      query_string.empty? ? nil : query_string
    end
  end
end
