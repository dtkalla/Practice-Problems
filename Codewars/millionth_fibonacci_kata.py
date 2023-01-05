# In this kata you will have to calculate fib(n) where:

# fib(0) := 0
# fib(1) := 1
# fin(n + 2) := fib(n + 1) + fib(n)

# Write an algorithm that can handle n up to 2000000.

# Your algorithm must output the exact integer answer, to full precision. Also, it must correctly handle negative numbers as input.


def fib(n):
    if n == 0:
        return 0
    elif n == 1:
        return 1
    if n < 0: #generalize for negatives; doesn't work for very large negatives
        f = 1
        f_plus_1 = 0
        for i in range(-n - 1):
            [f_plus_1,f] = [f,f_plus_1 - f]
        return f
    elif n > 10: #algorithm for large n
        x = (n + 1)//2
        lower_fib = fib(x-1)
        higher_fib = fib(x)
        if n % 2 == 0:
            return (2 * lower_fib + higher_fib) * higher_fib
        else:
            return lower_fib**2 + higher_fib**2
    else: #normal algorithm for small n
        f_minus_1 = 1
        f = 1
        for i in range(2,n):
            [f_minus_1,f] = [f,f+f_minus_1]
        return f