module Middleman
  module DataModel
    module Helpers
      def generator
        ::Middleman::DataModel.generator
      end

      def uml_svg(class_descriptor)
        generator.output_svg_for_class(class_descriptor)
      end
    end
  end
end
