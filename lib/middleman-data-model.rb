# Require core library
require 'middleman-core'
require 'middleman-data-model/uml_generator'
require 'middleman-data-model/helpers'

# Extension namespace
class DataModelExtension < ::Middleman::Extension
  # option :my_option, 'default', 'An example option'

  self.defined_helpers = [Middleman::DataModel::Helpers]

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
    Middleman::DataModel.generator = Middleman::DataModel::UMLGenerator.new(@app, self, options)
  end

  # A Sitemap Manipulator
  # def manipulate_resource_list(resources)
  # end
end

# Register extensions which can be activated
# Make sure we have the version of Middleman we expect
# Name param may be omited, it will default to underscored
# version of class name

::Middleman::Extensions.register(:data_model, DataModelExtension)
