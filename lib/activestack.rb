require 'stackdo'

COLUMN_WHITELIST = [
  :id,
  :created_at,
  :updated_at,
]

class Frame
  attr_reader :location, :method_reference, :records

  def initialize(location:, method_reference:, records:)
    @location = location
    @method_reference = method_reference
    @records = records
  end
end

class Record < Struct.new(:variable_name, :object)
  def attributes
    object.attributes.select { |name, value| COLUMN_WHITELIST.include?(name) }
  end
end

module ActiveStack
  def self.trace
    stack = Stackdo::CallStack.from_here

    frames = stack.walk.map do |frame|
      records = frame.environment.variables.map do |variable|
        if variable.value && variable.value.is_a?(ActiveRecord::Base)
          Record.new(variable.name, variable.value)
        end
      end.compact

      Frame.new(location: frame.location, method_reference: frame.method_reference, records: records)
    end
  end
end

