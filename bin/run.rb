#! /usr/bin/env ruby

require_relative '../lib/activestack'

module ActiveRecord
  class Base
    def attributes
      { :id => 15, :created_at => Time.now, :updated_at => Time.now }
    end
  end
end

a = ActiveRecord::Base.new

frames = ActiveStack.trace

frames.reverse.each_with_index do |frame, index|
  index.times { $stdout.print '  ' }
  puts frame.method_reference

  frame.records.each do |record|
    index.times { $stdout.print '  ' }
    puts "record: " + "#{record.variable_name}: #{record.attributes}"
  end

end

