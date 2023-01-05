# You are given the following information, but you may prefer to do some research for yourself.

#     1 Jan 1900 was a Monday.
#     Thirty days has September,
#     April, June and November.
#     All the rest have thirty-one,
#     Saving February alone,
#     Which has twenty-eight, rain or shine.
#     And on leap years, twenty-nine.
#     A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
#     How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?



def is_sunday?(yr,mo,date)
    (yr_code(yr) + mo_code(mo) + cen_code(yr) + date - lyc(yr,mo)) % 7 == 0 
end

def yr_code(yr)
    (yr + (yr / 4)) % 7
end

def mo_code(mo)
    mo_num = 'x033614625035'.split('')
    mo_num[mo].to_i
end

def cen_code(yr)
    return 6 if yr == 0
    0
end

def lyc(yr,mo)
    return 0 if mo > 2
    return 1 if yr % 4 == 0
    0
end

# puts is_sunday?(69,7,20)
# puts is_sunday?(92,3,27)

def num_sundays
    total = 0
    (0..99).each do |yr|
        (1..12).each do |mo|
            total += 1 if is_sunday?(yr,mo,1)
            p [yr,mo] if is_sunday?(yr,mo,1)
        end
    end
    total
end

# puts num_sundays