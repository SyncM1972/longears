#ifndef __LONGEARS_CONNECTION_H__
#define __LONGEARS_CONNECTION_H__

#include <Rinternals.h> /* for SEXP */
#include <pthread.h>
#include <amqp.h> /* for amqp_channel_t, amqp_connection_state_t */

#ifdef __cplusplus
extern "C" {
#endif

/* Forward declaration. */
struct consumer;
struct bg_consumer;
struct bg_conn;

typedef struct channel {
  amqp_channel_t chan;
  int is_open;
} channel;

typedef struct connection {
  amqp_connection_state_t conn;
  int is_connected;
  const char *host;
  int port;
  const char *vhost;
  const char *username;
  const char *password;
  const char *name;
  int timeout;
  channel chan;
  int next_chan;
  struct consumer *consumers;
  struct bg_conn *bg_conn;
  int heartbeat;
} connection;

typedef struct consumer {
  connection *conn;
  channel chan;
  amqp_bytes_t tag;
  SEXP fcall;
  SEXP rho;
  struct consumer *prev;
  struct consumer *next;
} consumer;

typedef struct bg_conn {
  connection *conn;
  pthread_t thread;
  pthread_mutex_t mutex;
  struct bg_consumer *consumers;
} bg_conn;

int init_bg_conn(connection *conn);
void destroy_bg_conn(bg_conn *conn);

int lconnect(connection *conn, char *buffer, size_t len);
int ensure_valid_channel(connection *, channel *, char *, size_t);

extern int amqp_tune_connection(amqp_connection_state_t state, int channel_max, int frame_max, int heartbeat);
#ifdef __cplusplus
}
#endif

#endif // __LONGEARS_CONNECTION_H__
