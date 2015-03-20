module Middleman
  module DataModel

    def self.generator=(g)
      @generator = g
    end

    def self.generator
      @generator
    end

    class UMLGenerator
      
      def self.plantuml_path
        spec = Gem::Specification.find_by_name("middleman-data-model")
        gem_root = spec.gem_dir
        File.join(gem_root, 'vendor', 'plantuml.jar')
      end
      
      def initialize(app, controller, options)
        @app = app
        @options = options
        @controller = controller
        
        # needed to interact with plantuml
        require 'open3'
      end

      def output_svg_for_class(class_descriptor)
        resource = class_descriptor['resource']
        model = class_descriptor['model']
        attributes = @app.data[model]['resource'][resource]['attributes']
        uml_descriptor = "@startuml\nobject #{resource} {\n"
        uml_descriptor = attributes.reduce(uml_descriptor) do |acc, a|
          acc + "#{a['type']} #{a['name']}\n"
        end
        uml_descriptor += "}\n@enduml\n"
        svg = ""
        Open3.popen3("java -jar #{UMLGenerator.plantuml_path} -tsvg -pipe") do |i,o,e,t|
          i << uml_descriptor
          i.close
          svg = o.read
        end
        svg
      end
    end
  end
end
