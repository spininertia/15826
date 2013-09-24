#ifndef __linkedlist_h
  #define __linkedlist_h
  #include "dfn.h"
  #include "vector.h"

  typedef struct Node {
    NUMBER dist;
    VECTOR *pvec;
    struct Node *next;
  } NODE;

  typedef struct Priority_queue {
    int num_node;
    int max_size;
    NODE *head;
  } PRIORITY_QUEUE;
 
  NODE *node_init();
  void node_free();
  void remove_first(PRIORITY_QUEUE *queue);
  void insert_in_order(PRIORITY_QUEUE *queue, NODE *node);
  PRIORITY_QUEUE *queue_init(int size);
  void queue_free(PRIORITY_QUEUE *queue);
  void node_print(NODE *node);
  void queue_print(PRIORITY_QUEUE *queue);

#endif
