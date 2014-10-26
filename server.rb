require 'sinatra'
require './routes'

class Server
  ROOT = File.dirname(__FILE__)

  def initialize
    load_models
  end

  def self.loan
    @loan
  end

  def self.loan=value
    @loan = value
  end

  private

  def load_models
    Dir[File.join ROOT, 'models', '**', '*'].each { |filename| require filename }
  end
end

Server.new
