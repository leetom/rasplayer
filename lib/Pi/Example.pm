package Pi::Example;
use Mojo::Base 'Mojolicious::Controller';
use Scalar::Util qw(looks_like_number);
use utf8;

# This action will render a template
sub welcome {
  my $self = shift;

  # Render template "example/welcome.html.ep" with message
  $self->render(
    message => 'Welcome to the Mojolicious real-time web framework!');
}

sub music {
    my $self = shift;
    my $id = $self->param('track');

    #歌曲编号了。
    if(looks_like_number $id){
        if(defined $self->app->mp3->[$id]){
            # there is sound to play
            my $player = $self->app->music_dir . "player.pl";
            my @arg = ($player, $self->app->mp3->[$id]);

            $self->app->log->info( "start to play ", $arg[1]);
            system(@arg) == 0 or $self->app->log->warn("error play file @arg");
        }
        $self->redirect_to("/music");
    }else{
        $self->render(mp3 => $self->app->mp3);
    }
}

sub stop {
    my $self = shift;

    system("pkill mpg123");

    $self->redirect_to("/music");
}

1;
