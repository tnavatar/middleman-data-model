module Middleman
  module DataModel
    module Helpers
      def generator
        ::Middleman::DataModel.generator
      end

      def model_uml(class_descriptor)
        generator.output_svg_for_class(class_descriptor)
      end
      
      # generate attribute list for 
      def model_attribute_list(attributes = nil, options = {})
        attributes ||= current_page.data.attributes
        attributes.reduce("") do |acc, a|
          list = content_tag(:dt, 'definition') +
                 content_tag(:dd, a['definition']) +
                 content_tag(:dt, 'type') +
                 content_tag(:dd, a['type'])
          acc + content_tag(:h4, a['name']) +
            content_tag(:dl, list, options = {})
        end
      end
      
      def model_example_list(examples = nil, options = {})
        examples ||= current_page.data.examples
        example_list = examples.reduce("") do |acc, e|
          acc + content_tag(:dt, e['title']) +
            content_tag(:dd, e['description'])
        end
        content_tag(:dl, example_list, options)
      end
      
      def model_navbar
      end
      
    end
  end
end
