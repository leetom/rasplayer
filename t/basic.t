use Mojo::Base -strict;

use Test::More tests => 2;
use Test::Mojo;

my $t = Test::Mojo->new('Pi');
#$t->get_ok('/')->status_is(200)->content_like(qr/Mojolicious/i);

$t->get_ok('/music')->status_is(200);
