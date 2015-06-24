package Pi;
use Mojo::Base 'Mojolicious';
use File::Basename;
use Encode;

my $music_dir = "./music/";
has music_dir => $music_dir;

has mp3 => sub { get_musics() };

# This method will run once at server start
sub startup {
  my $self = shift;

  # Documentation browser under "/perldoc"
  $self->plugin('PODRenderer');


  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->get('/music')->to('example#music');
  $r->get('/stop')->to('example#stop');
}

sub get_musics {

    my @mp3 = glob($music_dir . "*.mp3");

    my @name;
    for my $path (@mp3){
        push @name, decode('UTF-8', basename($path, ".mp3"));
    }

    return \@name;
}    

1;
