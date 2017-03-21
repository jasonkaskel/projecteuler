# In England the currency is made up of pound, £, and pence, p,
#  and there are eight coins in general circulation:

# 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
# It is possible to make £2 in the following way:

# 1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
# How many different ways can £2 be made using any number of coins?
# Time to complete: 1 hour


def combinations(set, amount)
  return [] unless set.size > 0
  array = []

  coin_index = 0
  while coin_index < set.size
    coin = set[coin_index]
    remaining_coins = set[coin_index+1..-1]

    coin_count = amount / coin

    if coin_count > 0 && amount % coin == 0
      array << coin_count.times.map { coin }
      coin_count -= 1
    end

    if coin > 1
      while coin_count > 0
        combinations(remaining_coins, amount - coin_count * coin).map do |combination|
          array << (coin_count.times.map { coin } + combination)
        end

        coin_count -= 1
      end
    end

    coin_index += 1
  end

  array
end

coins = [200, 100, 50, 20, 10, 5, 2, 1]
goal = 200

answer = combinations(coins, 200)
p answer.size
