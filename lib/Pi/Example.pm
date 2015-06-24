package Pi::Example;
use Mojo::Base 'Mojolicious::Controller';

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

    if($id){
        # there is sound to play
        my @arg = ("../../music/player.pl", $id);
        system(@arg) == 0 or die("error play file @arg");

        $self->redirect_to("/music");
    }else{
        $self->render();
    }
}

sub stop {
    my $self = shift;

    system("pkill mpg123");

    $self->redirect_to("/music");
}

1;
