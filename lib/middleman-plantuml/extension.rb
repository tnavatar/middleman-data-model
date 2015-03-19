module Middleman
  class PlantUMLExtension < Extension
    delegate :logger, to: :app
  end

  def initialize(app, options_hash={}, &block)
    super
  end
  
end
