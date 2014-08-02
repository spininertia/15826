#!/usr/bin/env python
# encoding: utf-8

import sys
import os

def edit_distance(word1, word2, deletion_cost, sub_cost):
  cost = [[0 for col in range(len(word1) + 1)] for row in range(len(word2) + 1)]
  cost[0][0] = 0
  # dp
  for i in range(1, len(cost)):
    cost[i][0] = cost[i - 1][0] + deletion_cost

  for i in range(1, len(cost[0])):
    cost[0][i] = cost[0][i - 1] + deletion_cost

  for i in range(1, len(cost)):
    for j in range(1, len(cost[0])):
      if(word1[j - 1] == word2[i - 1]):
        cost[i][j] = cost[i - 1][j - 1]
      else:
        cost[i][j] = min(cost[i - 1][j - 1] + sub_cost, \
            cost[i][j - 1] + deletion_cost, cost[i - 1][j] + deletion_cost)

  #print('\n'.join([' '.join(['{:4}'.format(item) for item in row]) for row in cost]))
  print "cost: %.1f" % cost[len(word2)][len(word1)]
  path = []
  i = len(word2);
  j = len(word1);
  path.append((i,j))
  
  # backtrack
  while(i != 0 and j != 0):
    if (word1[j - 1] == word2[i - 1]):
      i -= 1
      j -= 1
    elif (cost[i][j] == cost[i - 1][j - 1] + sub_cost):
      i -= 1
      j -= 1
    elif (cost[i][j] == cost[i - 1][j] + deletion_cost):
      i -= 1
    else:
      j -= 1
    path.append((i, j))
  path.reverse()
  for k in range(1, len(path)):
    i0, j0 = path[k - 1]
    i1, j1 = path[k]
    if (i1 == i0 + 1 and j1 == j0 + 1):
      print word1[j1 - 1] + ' -> ' + word2[i1 - 1]
    elif (i1 == i0 + 1):
      print '* -> ' + word2[i1 - 1]
    else:
      print word1[j1 - 1] + ' -> *'


def main():
  if (len(sys.argv) >= 5):
    word1 = sys.argv[1]
    word2 = sys.argv[2]
    deletion_cost = float(sys.argv[3])
    sub_cost = float(sys.argv[4])
  else:
    print "No parameters given. Use format: "
    print 'python edit_dist.py  "string 1" "string 2" 1 0.5'
    print 'where 1 is the example deletion cost and 0.5 is the example substitution cost'
    print "\nRunning in demo mode with 'some string' and 'somestring 2' with both costs at 1"
    word1 = "some string"
    word2 = "somestring 2"
    deletion_cost = 1 
    sub_cost = 0.5 


    ########################################## 
    ###### ADD YOUR IMPLEMENTATION HERE ######
  ##########################################
  edit_distance(word1, word2, deletion_cost, sub_cost)

if __name__ == '__main__':
  main()
