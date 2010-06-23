require 'rubygems'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "elasticsearch"))

require 'encoding'
require 'transport'
require 'client'

module ElasticSearch
  
  
  class << self
    attr_accessor :client
    
    def setup(servers, options={})
      @servers, @options = servers, options
    end  
    
    def client
      @client ||= ElasticSearch::Client.new(@servers, @options)
    end
  end
end
