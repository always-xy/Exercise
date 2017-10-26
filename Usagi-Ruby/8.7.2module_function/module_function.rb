def hello(name)
  puts "Hello, #{name}"
end

module_function :hello

module FooModule
  def foo
  	p self
  end
  module_function :foo
end

FooModule.foo  #=》FooModule