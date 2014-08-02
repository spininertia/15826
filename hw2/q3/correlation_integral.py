#correlation_intgral.py

import sys
import math

def read_points(file_name):
  f = open(file_name, 'r')
  points = []
  for line in f:
    tokens = line.split()
    x = float(tokens[0])
    y = float(tokens[1])
    points.append((x, y))
  return points

def euclidian_distance(point1, point2):
  x1,y1 = point1
  x2,y2 = point2
  return math.sqrt((x1 - x2) ** 2 + (y2 - y1) ** 2)

def correlation_integral(points):
  distances = []
  for point1 in points:
    for point2 in points:
      distances.append(euclidian_distance(point1, point2))

  intervals = [ 2**i for i in range(-2, 14)]
  return [(interval, len(filter(lambda x:x <= interval, distances))) for interval in intervals]

def compute_slope(cr_points):
  x1, y1 = cr_points[2]
  x2, y2 = cr_points[12]
  return (math.log(y2) - math.log(y1)) / (math.log(x2) - math.log(x1))
  
if __name__ == '__main__':
  data_file = sys.argv[1]
  points = read_points(data_file)
  cr_points = correlation_integral(points)
  w_file = file(data_file + '.point', 'w')
  for x, y in cr_points:
    w_file.write('%f %f\n' % (x, y))
  print compute_slope(cr_points)
