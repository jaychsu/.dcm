begin
  require 'awesome_print'
  Pry.config.print = proc { |output, value| output.puts value.ai }
rescue LoadError
  puts 'awesome_print not available :('
end

begin
  require 'hirb'
  old_print = Pry.config.print
  Pry.config.print = proc do |output, value|
    Hirb::View.view_or_page_output(value) || old_print.call(output, value)
  end
  Hirb.enable
rescue LoadError
  puts 'hirb not available :('
end


Pry.config.hooks.add_hook(:before_session, :greetings) do

  puts "You are using #{RUBY_DESCRIPTION}. Have fun ;)"

  if defined?(ActiveRecord)
    ActiveRecord::Base.logger = Logger.new(STDOUT)
  end

  if defined?(Mongoid)
    Mongoid.logger = Logger.new(STDOUT)
  end

  if defined?(MongoMapper)
    MongoMapper.connection.instance_variable_set(:@logger, Logger.new(STDOUT))
  end

  if defined?(Rails)
    Rails.logger = Logger.new(STDOUT)
  end
end

Pry.commands.alias_command 'c', 'continue'
Pry.commands.alias_command 's', 'step'
Pry.commands.alias_command 'n', 'next'
Pry.commands.alias_command 'u', 'up'
Pry.commands.alias_command 'd', 'down'
Pry.commands.alias_command 'em', 'edit-method'

# vim: set ft=ruby:
