#include "linkedlist.h"

NODE *node_init() {
  NODE *node = (NODE*) malloc(sizeof(NODE));
  node->next = NULL;
  return node;
}

void node_free(NODE *node) {
  if (node->next != NULL)
    node_free(node->next);
  free(node);
}

void node_print(NODE *node) {
  if (node->next != NULL) {
    node_print(node->next);
  }
  printf("%f\t",node->dist);
  vecprint(node->pvec);
}

void remove_first(PRIORITY_QUEUE *queue) {
  NODE *node = queue->head->next;
  if(node != NULL) {
    queue->head->next = node->next;
    free(node);
    queue->num_node--;
  }
}

void insert_in_order (PRIORITY_QUEUE *queue, NODE *node) {
  NODE *ptr = queue->head;
  while (ptr->next != NULL) {
    if (node->dist >= ptr->next->dist) {
      break;
    }
    ptr = ptr->next;
  }
  node->next = ptr->next;
  ptr->next = node;
  queue->num_node++;
  if (queue->num_node > queue->max_size) {
    remove_first(queue);
  }
}

PRIORITY_QUEUE *queue_init(int size) {
  PRIORITY_QUEUE *queue = (PRIORITY_QUEUE *)malloc(sizeof(PRIORITY_QUEUE));
  queue->head = node_init();
  queue->max_size = size;
  queue->num_node = 0;
  return queue;
}

void queue_free(PRIORITY_QUEUE *queue) {
  node_free(queue->head);
  free(queue);
}

void queue_print(PRIORITY_QUEUE *queue) {
  node_print(queue->head->next);
}
