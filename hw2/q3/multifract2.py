#multifract2.py
bias = 0.8
total_access = 2048
order = 11
time_slot = 2048

def multi_fract(order, time):
  prob = 1
  for i in range(order):
    if (time % 2 == 1):
      prob *= bias
    else:
      prob *= 1 - bias
    time /= 2
  return total_access * prob

def gen_hist():
  return [(i, multi_fract(order, i)) for i in range(2048)]

if __name__ == '__main__':
  hist = gen_hist()
  for time, access in hist:
    print time, access
