require 'rubygems'
require 'irbtools/configure'

Irbtools.replace_library_callback :fancy_irb do
  FancyIrb.start :colorize => {:input_prompt => nil, :input => nil}
end

# irbtools-more depends on drx which may not build on some rubies,
# in this case we add bond manually.
begin
  require 'irbtools/more'
rescue LoadError
  Irbtools.add_library :bond, :thread => 'bond' do
    Bond.start
  end
end

Irbtools.start

rails_root = File.basename(Dir.pwd)
IRB.conf[:PROMPT] ||= {}
IRB.conf[:PROMPT][:RAILS] = {
  :PROMPT_I => "#{rails_root}> ",
  :PROMPT_S => "#{rails_root}* ",
  :PROMPT_C => "#{rails_root}? ",
  :RETURN   => "=> %s\n"
}
IRB.conf[:PROMPT_MODE] = :RAILS

# Called after the irb session is initialized and Rails has
# been loaded (props: Mike Clark).
IRB.conf[:IRB_RC] = Proc.new do

  if defined?(ActiveRecord)
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Base.instance_eval { alias :[] :find }
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

# vim: set ft=ruby:
