
package foo;

use base CGI::Application;
use CGI::Application::Plugin::ErrorPage 'error';

sub error {
     my $c = shift;
     return $c->CGI::Application::Plugin::ErrorPage::error(
         tmpl => \'Surprise! <tmpl_var title> <tmpl_var msg>',
         @_,
     );
}


package main;
use Test::More 'no_plan';

my $foo = foo->new;

is( 
    $foo->error( title => 'Technical Failure', msg   => 'BOOM!'),
    'Surprise! Technical Failure BOOM!',
);
