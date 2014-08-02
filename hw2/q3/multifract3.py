#multifract3.py
total_access = 2048
time_slot = 2187
biases = [0.1, 0.2, 0.7]
order = 7

def multi_fract(order, time):
  prob = 1
  for i in range(order):
    prob *= biases[time % 3]
    time /= 3
  return total_access * prob

def gen_hist():
  return [(i, multi_fract(order, i)) for i in range(time_slot)]

if __name__ == '__main__':
  hist = gen_hist()
  for time,access in hist:
    print time, access

