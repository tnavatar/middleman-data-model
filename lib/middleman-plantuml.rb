# Require core library
require 'middleman-core'
require 'middleman-plantuml/uml_generator'
require 'middleman-plantuml/helpers'

# Extension namespace
class PlantUMLExtension < ::Middleman::Extension
  # option :my_option, 'default', 'An example option'

  self.defined_helpers = [Middleman::PlantUML::Helpers]

  def initialize(app, options_hash={}, &block)
    # Call super to build options from the options_hash
    super
    # Require libraries only when activated
    # require 'necessary/library'

    # set up your extension
    # puts options.my_option
  end

  def after_configuration
    # Do something
    Middleman::PlantUML.generator = Middleman::PlantUML::UMLGenerator.new(@app, self, options)
  end

  # A Sitemap Manipulator
  # def manipulate_resource_list(resources)
  # end
end

# Register extensions which can be activated
# Make sure we have the version of Middleman we expect
# Name param may be omited, it will default to underscored
# version of class name

# PlantUMLExtension.register(:plant_uml, PlantUMLExtension)
::Middleman::Extensions.register(:plant_uml, PlantUMLExtension)
