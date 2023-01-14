# DESCRIPTION:
# Your task in order to complete this Kata is to write a function which formats a duration, given as a number of seconds, in a human-friendly way.

# The function must accept a non-negative integer. If it is zero, it just returns "now". Otherwise, the duration is expressed as a combination of years, days, hours, minutes and seconds.

# It is much easier to understand with an example:

# * For seconds = 62, your function should return 
#     "1 minute and 2 seconds"
# * For seconds = 3662, your function should return
#     "1 hour, 1 minute and 2 seconds"
# For the purpose of this Kata, a year is 365 days and a day is 24 hours.

# Note that spaces are important.

# Detailed rules
# The resulting expression is made of components like 4 seconds, 1 year, etc. In general, a positive integer and one of the valid units of time, separated by a space. The unit of time is used in plural if the integer is greater than 1.

# The components are separated by a comma and a space (", "). Except the last component, which is separated by " and ", just like it would be written in English.

# A more significant units of time will occur before than a least significant one. Therefore, 1 second and 1 year is not correct, but 1 year and 1 second is.

# Different components have different unit of times. So there is not repeated units like in 5 seconds and 1 second.

# A component will not appear at all if its value happens to be zero. Hence, 1 minute and 0 seconds is not valid, but it should be just 1 minute.

# A unit of time must be used "as much as possible". It means that the function should not return 61 seconds, but 1 minute and 1 second instead. Formally, the duration specified by of a component must not be greater than any valid more significant unit of time.






def format_duration(seconds):
    if seconds == 0:
        return 'now'
    minutes = seconds // 60
    hours = minutes // 60
    days = hours // 24
    years = days // 365
    seconds = seconds % 60
    minutes = minutes % 60
    hours = hours % 24
    days = days % 365
    st = []
    if seconds == 1:
        st.append('1 second')
    elif seconds > 0:
        st.append(f"{str(seconds)} seconds")
    if minutes == 1:
        st.append('1 minute')
    elif minutes > 0:
        st.append(f"{str(minutes)} minutes")
    if hours == 1:
        st.append('1 hour')
    elif hours > 0:
        st.append(f"{str(hours)} hours")
    if days == 1:
        st.append('1 day')
    elif days > 0:
        st.append(f"{str(days)} days")
    if years == 1:
        st.append('1 year')
    elif years > 0:
        st.append(f"{str(years)} years")
    print(st)
    st.reverse()
    print(st)
    if len(st) > 2:
        st = [', '.join(st[0:len(st)-1]),st[-1]]
    return ' and '.join(st)



# print(format_duration(1))
