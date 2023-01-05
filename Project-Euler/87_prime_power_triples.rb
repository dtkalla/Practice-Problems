# The smallest number expressible as the sum of a prime square, prime cube, and prime fourth power is 28. In fact, there are exactly four numbers below fifty that can be expressed in such a way:

# 28 = 22 + 23 + 24
# 33 = 32 + 23 + 24
# 49 = 52 + 23 + 24
# 47 = 22 + 33 + 24

# How many numbers below fifty million can be expressed as the sum of a prime square, prime cube, and prime fourth power?



def is_prime?(n)
    (2..Math.sqrt(n)).all? {|i| n % i != 0}
end

# generate lists of prime powers below 50,000,000

def square_primes
    arr = []
    (2..7071).each {|p| arr << p**2 if is_prime?(p)}
    arr
end

def cube_primes
    arr = []
    (2..367).each {|p| arr << p**3 if is_prime?(p)}
    arr
end

def quad_primes
    arr = []
    (2..83).each {|p| arr << p**4 if is_prime?(p)}
    arr
end


def prime_power_triples
    nums = Hash.new(0)
    squares = square_primes
    cubes = cube_primes
    quads = quad_primes
    quads.each do |quad|
        cubes.each do |cube|
            if quad + cube < 50000000 # squares are last because there are more of them -- this minimizes runtime
                squares.each do |square|
                    sum = square + cube + quad
                    nums[sum] += 1 if sum < 50000000 # use a hash to avoid double-counting
                end
            end
        end
    end
    nums.keys.length
end

# p prime_power_triples