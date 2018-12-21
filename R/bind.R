#' Bind Queues to Exchanges
#'
#' In order for messages to be routed to a queue, the queue must be bound to
#' the exchange, although the nature of this binding depends on the type of
#' exchange.
#'
#' @param conn An object returned by \code{\link{amqp_connect}}.
#' @param queue The name of the queue.
#' @param exchange The name of an exchange.
#' @param routing_key The routing key to use (if applicable).
#'
#' @aliases amqp_bindings
#' @rdname amqp_bindings
#' @export
amqp_bind_queue <- function(conn, queue, exchange, routing_key = "") {
  if (!inherits(conn, "amqp_connection")) {
    stop("`conn` is not an amqp_connection object")
  }
  amqp_bind_queue_(conn$ptr, queue, exchange, routing_key)
}

#' @rdname amqp_bindings
#' @export
amqp_unbind_queue <- function(conn, queue, exchange, routing_key = "") {
  if (!inherits(conn, "amqp_connection")) {
    stop("`conn` is not an amqp_connection object")
  }
  amqp_unbind_queue_(conn$ptr, queue, exchange, routing_key)
}