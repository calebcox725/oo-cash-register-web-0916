class CashRegister

 attr_accessor :total
 attr_reader :discount

 def initialize (discount = 0)
   @total = 0
   @discount = discount
   @items_list = []
   @last_transaction = []
 end

 def add_item(title, price, quantity = 1)
   @total = @total + (price*quantity)
   quantity.times do
     @items_list << title
   end

   @last_transaction = [title, price, quantity]
 end

 def apply_discount

   if @discount == 0
     "There is no discount to apply."
   else
     @total = ((100-@discount)*@total)/100
     "After the discount, the total comes to $#{@total}."
   end

 end

 def items
   @items_list
 end

 def void_last_transaction

   @total = @total - (@last_transaction[1] * @last_transaction[2])

   @last_transaction[2].times do
     @items_list.pop
   end

 end

end
