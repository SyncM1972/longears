% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/connection.R
\name{amqp_connections}
\alias{amqp_connections}
\alias{amqp_connect}
\alias{amqp_reconnect}
\alias{amqp_disconnect}
\title{Connections to a RabbitMQ Server}
\usage{
amqp_connect(host = "localhost", port = 5672L, vhost = "/",
  username = "guest", password = "guest", timeout = 10L)

amqp_reconnect(conn)

amqp_disconnect(conn)
}
\arguments{
\item{host}{The server host.}

\item{port}{The server port.}

\item{vhost}{The desired virtual host.}

\item{username}{User credentials.}

\item{password}{User credentials.}

\item{timeout}{A timeout, in seconds, for operations that support it.}

\item{conn}{An object returned by \code{\link{amqp_connect}}.}
}
\value{
An \code{amqp_connection} object.
}
\description{
Connect, disconnect, and reconnect to RabbitMQ servers. When possible, we
automatically recover from connection errors, so manual reconnection is not
usually necessary.

For those familiar with the AMQP protocol: we manage channels internally, and
automatically recover from channel-level errors.
}
\examples{
\dontrun{
conn <- amqp_connect(password = "wrong")
conn <- amqp_connect()
amqp_disconnect(conn)
}

}
