# Suppose we could access yesterday's stock prices as an array, where:
#
# The values are the price in dollars of Apple stock.
# A higher index indicates a later time.
# So if the stock cost $500 at 10:30am and $550 at 11:00am, then:
#
# stock_prices_yesterday[60] = 500
#
# Write an efficient function that takes stock_prices_yesterday and returns the best profit I could have made from 1 purchase and 1 sale of 1 Apple stock yesterday.
#
# For example:
#
#   stock_prices_yesterday = [10, 7, 5, 8, 11, 9]
#
# get_max_profit(stock_prices_yesterday)
# # returns 6 (buying for $5 and selling for $11)
#
# No "shorting"—you must buy before you sell. You may not buy and sell in the same time step (at least 1 minute must pass).

# Brute Force Steps
# 1. Set sample array
# 2. Take the first number subtract it against all subsequent numbers

  # Create a hash of {number: profit} // {10:5, 7:2, 5:0, 8:0, 11:2, 9:0} Don't forget you can't go backwards.
  # use the each_with_index.map iterator to work through this
# require 'pry'
#
#   array = [10, 1, 2, 5, 7, 11]
#   profit_hash = Hash.new
#   count = 0
#
#   until count = array.length
#     profit_array = []
#     current_number = array[count]
#
#     array.map do |number|
#       profit = current_number - array[count+1]
#       profit_array.push(profit)
#     end
#
#     max_profit = profit_array.max
#     profit_hash[array[count]] = max_profit
#     count += 1
#   end
#
#   print count
#   print profit_hash

  def get_max_profit_1(array)

      max_profit = 0

      # go through every time.  "for .. in.. is pretty much the same as an .each method."
      # the FIRST for..in will take the FIRST item
      for outer_index in (0...array.length)

          # for every time, go through every OTHER time.  These are essentially indexes.
          #the SECOND for..in will go through EVERY OTHER ITEM with the first item in tow.
          for inner_index in (0...array.length)

              # for each pair, find the earlier and later times.
              # You need to set this because the index is essentially moving!
              earlier_index = [outer_index, inner_index].min
              later_index   = [outer_index, inner_index].max

              # ----- up to this point you're just finding pairs of indexes ----

              # Now you're using the indexes to find the earlier and later prices
              earlier_price = array[earlier_index]
              later_price   = array[later_index]

              # see what our profit would be if we bought at the
              # earlier price and sold at the later price
              potential_profit = later_price - earlier_price

              # update max_profit if we can do better
              max_profit = [max_profit, potential_profit].max
          end
      end

      print max_profit
  end


# This solution below avoids looking at all pairs twice
# It allows you look only at inner loops AFTER the outerloop is set.
# However, this is STILL 0(n2)

  def get_max_profit_2(array)

    max_profit = 0

    # go through every price (with it's index as the time)
    array.each_with_index do |number, index|

        # and go through all the LATER prices
        for later_price in array[index+1..-1]

            # see what our profit would be if we bought at the
            # earlier price and sold at the later price
            potential_profit = later_price - number

            # update max_profit if we can do better
            max_profit = [max_profit, potential_profit].max
        end
    end

    return max_profit
end


# ----This one goes through the array ONCE and substitutes max as it goes along ----

def get_max_profit_3(array)

  min_price = array[0] #sets the minimum price starting at index 0
  max_price = 0

  max_profit = 0 #sets current max_profit to 0
  min_loss = 0


  array.each do |current_price| #simple iteration

      # ensure min_price is the lowest price we've seen so far
      min_price = [min_price, current_price].min
      max_price = [min_price, current_price].max

      # see what our profit would be if we bought at the
      # min price and sold at the current price
      potential_profit = current_price - min_price
      potential_loss = current_price - max_price

      # update max_profit if we can do better
      max_profit = [max_profit, potential_profit].max
      min_loss = [min_loss, potential_loss].min

      print "current-price: #{current_price}\n"
      print "min_price: #{min_price}\n"
      print "max_price: #{max_price}\n"
      print "-----------------------------\n"
      print "potential_profit: #{potential_profit}\n"
      print "potential_loss: #{potential_loss}\n"
      print "-----------------------------\n"
      print "max_profit: #{max_profit}\n"
      print "min_loss: #{min_loss}\n"
      print "\n"
  end

  return max_profit
end

array = [10, 8, 6, 2, 1]

print get_max_profit_3(array)
