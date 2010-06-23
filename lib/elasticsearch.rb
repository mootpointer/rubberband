require 'rubygems'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "elasticsearch"))

require 'encoding'
require 'transport'
require 'client'

module ElasticSearch
  class << self
    attr_accessor :client, :servers, :options
    
    def setup(servers=[], options={}, &block)
      @servers, @options = servers, options
      if block
        yield self
      end
      self.client
    end  
    
    def client
      @client ||= ElasticSearch::Client.new(@servers, @options)
    end
  end
end
