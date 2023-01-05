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
    if n < 0: #generalize for negatives
        f = 1
        f_plus_1 = 0
        for i in range(-n - 1):
            [f_plus_1,f] = [f,f_plus_1 - f]
        return f
    elif n > 1000: #Djikstra's algorithm for large n
        x = (n + 1)//2
        if n % 2 == 0:
            return (2 * fib(x-1) + fib(x)) * fib(x)
        else:
            return fib(x-1)**2 + fib(x)**2
    else: #normal algorithm for non-large n
        f_minus_1 = 1
        f = 1
        for i in range(2,n):
            [f_minus_1,f] = [f,f+f_minus_1]
        return f