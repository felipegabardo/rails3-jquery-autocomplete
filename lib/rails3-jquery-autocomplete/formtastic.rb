#
# Load the formtastic plugin if using Formtastic
begin
  require 'formtastic'

  if Formtastic.constants.include?(:VERSION)

    #
    # Formtastic 2.0
    #


    module Formtastic
      module Inputs
        class AutocompleteInput
          include Base
          include Base::Stringish

          def to_html
            input_wrapping do
              label_html <<
              builder.autocomplete_field(method, options.delete(:url), input_html_options)
            end
          end
        end
      end
    end
  else

    #
    # Formtastic 1.x
    #
    class Formtastic::FormBuilder < ActionView::Helpers::FormBuilder
      include Rails3JQueryAutocomplete::FormtasticPlugin
    end
  end
rescue LoadError
end
