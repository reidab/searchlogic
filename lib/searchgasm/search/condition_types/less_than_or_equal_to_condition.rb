module BinaryLogic
  module Searchgasm
    module Search
      module ConditionTypes
        class LessThanOrEqualToCondition < Condition
          class << self
            def name_for_column(column)
              return unless comparable_column?(column)
              super
            end
            
            def aliases_for_column(column)
              ["#{column.name}_lte", "#{column.name}_at_most"]
            end
          end
          
          def to_conditions(value)
            ["#{quoted_table_name}.#{quoted_column_name} <= ?", value]
          end
        end
      end
      
      Conditions.register_condition(ConditionTypes::LessThanOrEqualToCondition)
    end
  end
end