class CashRegister
  attr_accessor :total  

  def initialize(discount=nil)
    @discount = discount
    @items = []
    @total = 0
    @last_transaction = []
  end

  def total
    @total
  end

  def discount
    @discount
  end

  def add_item(item,price,quantity=1)
    @items += Array.new(quantity,item)
    @total += price * quantity
    @last_transaction << price * quantity
  end

  def apply_discount
    if !@discount
      "There is no discount to apply."
    else
      @total = (@total * (100 - @discount)/100).round(2)
      "After the discount, the total comes to $#{@total.to_s.gsub(/\.0$/,'')}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @last_transaction.pop
    #to do: remove items as well
  end
end
