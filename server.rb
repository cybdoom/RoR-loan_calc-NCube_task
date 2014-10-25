require 'sinatra'
require './routes'

class Server
  ROOT = File.dirname(__FILE__)

  def initialize
    load_models
    load_helpers
  end

  private

  def load_models
    Dir[File.join ROOT, 'models', '**', '*'].each { |filename| require filename }
  end

  def load_helpers
    Dir[File.join ROOT, 'helpers', '**', '*'].each { |filename| require filename }
  end
end

Server.new
