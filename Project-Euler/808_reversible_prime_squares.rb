# Both 169 and 961 are the square of a prime. 169 is the reverse of 961.

# We call a number a reversible prime square if:

# It is not a palindrome, and
# It is the square of a prime, and
# Its reverse is also the square of a prime.
# 169 and 961 are not palindromes, so both are reversible prime squares.

# Find the sum of the first 50 reversible prime squares.


# most efficient method to generate list of primes, I think
def primes(n)
    arr = (2..n).to_a
    sqrt = Math.sqrt(n)
    i = 0
    while arr[i] < sqrt
        arr.reject! {|k| k % arr[i] == 0 && k != arr[i]}
        i += 1
    end
    primes_hash = Hash.new(false)
    arr.each {|p| primes_hash[p] = true}
    primes_hash
end

# p primes(100)
# p primes(1000000)

# O(p) time complexity, minimal space complexity
def reversible_prime_squares(n)
    arr = []
    primes = primes(n)
    primes.each_key do |prime|
        squared = (prime**2).to_s
        reverse = Math.sqrt(squared.reverse.to_i)
        if reverse % 1 == 0
            if primes[reverse.to_i]
                arr << prime unless squared == squared.reverse
                p arr
                p arr.length
            end
        end
    end
    arr2 = arr.map {|ele| ele**2}
    p arr2
    arr2.sum
end


p reversible_prime_squares(100000000)




# much less efficient method

# def prime_square?(n)
#     sqrt = Math.sqrt(n)
#     return false unless sqrt % 1 == 0
#     prime?(sqrt)
# end

# def reversible_prime_square?(n)
#     prime_square?(n) && prime_square?((n.to_s.reverse).to_i) && n.to_s.reverse != n.to_s
# end

# # puts prime_square?(7)
# # puts prime_square?(25)
# # puts reversible_prime_square?(25)
# # puts reversible_prime_square?(169)



# def reversible_prime_squares(n)
#     arr = []
#     i = 2
#     until arr.length == n
#         if reversible_prime_square?(i)
#             arr << i
#             puts i
#         end
#         i += 1
#     end
#     arr
# end


# p reversible_prime_squares(30)
