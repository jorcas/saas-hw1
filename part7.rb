# HW 1-7: Iterators, Blocks, Yield 

@testing = false

class CartesianProduct
  include Enumerable
  def initialize(elem_a, elem_b)
    @product = Array.new
    elem_a.each do |a|
      elem_b.each do |b|
        p = Array.new
        p << a
        p << b
        @product << p
      end
    end
  end
  def each
    idx = 0
    while idx < @product.length
      yield @product[idx]
      idx = idx + 1
    end
  end
end

if @testing
c = CartesianProduct.new([:a,:b], [4,5])
c.each { |elt| puts elt.inspect }

c = CartesianProduct.new([:a,:b], [])
c.each { |elt| puts elt.inspect }
end


