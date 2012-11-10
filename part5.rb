# HW 1-5: Advanced OOP, Metaprogramming, Open Classes and Duck Typing 

@debug = false
@testing = false

class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s        # make sure it's a string
    attr_reader attr_name             # create the attribute's getter
    attr_reader attr_name+"_history"  # create attribute's history getter
    class_eval(%Q(
      def #{attr_name}=(val)
        if @#{attr_name+"_history"}.class == NilClass
          @#{attr_name+"_history"} = Array.new
          @#{attr_name+"_history"} << @#{attr_name}
        end
        @#{attr_name}=val
        @#{attr_name+"_history"} << val
      end
    ))
  end
end

if @testing
=begin
class Foo1
  #attr_reader :bar
  #attr_reader :bar_history
  #attr_accessor_with_history :bar
  def initialize
  @bar_history = Array.new
  @bar_history << @bar
  end
  def bar_history
    @bar_history
  end
  def bar=(val)
    @bar = val
    @bar_history << val
  end
end
f = Foo1.new
f.bar = 3
f.bar = :wowzo
f.bar = 'boo!'
puts f.bar_history
puts "---------------"
=end

class Foo
  attr_accessor_with_history :bar
  attr_accessor_with_history :ppp
end

f = Foo.new
f.bar = 3
f.bar = :wowzo
f.bar = 'boo!'
f.ppp = 1
f.ppp = :xxx
f.ppp = '333!'
puts f.bar_history
puts f.ppp_history
end

