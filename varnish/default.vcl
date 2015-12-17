#
# This is an example VCL file for Varnish.
#
# It does not do anything by default, delegating control to the
# builtin VCL. The builtin VCL is called when there is no explicit
# return statement.
#
# See the VCL chapters in the Users Guide at https://www.varnish-cache.org/docs/
# and http://varnish-cache.org/trac/wiki/VCLExamples for more examples.

# Marker to tell the VCL compiler that this VCL has been adapted to the
# new 4.0 format.
vcl 4.0;
import directors;
# Default backend definition. Set this to point to your content server.

backend web1 {
    .host = "192.168.50.40";
    .port = "80";
}

backend web2 {
    .host = "192.168.50.41";
    .port = "80";
}

sub vcl_init {
    new round_robin_director = directors.round_robin();
    round_robin_director.add_backend(web1);
    round_robin_director.add_backend(web2);
    new random_director = directors.random();
    random_director.add_backend(web1, 10);  # 2/3 to backend one
    random_director.add_backend(web2, 5);   # 1/3 to backend two
}


sub vcl_recv {
    # Happens before we check if we have this in cache already.
    #
    # Typically you clean up the request here, removing cookies you don't need,
    # rewriting the request, etc.
    set req.backend_hint = round_robin_director.backend();
}

sub vcl_backend_response {
    # Happens after we have read the response headers from the backend.
    #
    # Here you clean the response headers, removing silly Set-Cookie headers
    # and other mistakes your backend does.
}

sub vcl_deliver {
    # Happens when we have all the pieces we need, and are about to send the
    # response to the client.
    #
    # You can do accounting or modifying the final object here.
}
