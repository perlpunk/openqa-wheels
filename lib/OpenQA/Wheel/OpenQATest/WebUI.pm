package OpenQA::Wheel::OpenQATest::WebUI;
use strict;
use warnings;

use base 'Exporter';
our @EXPORT_OK = qw(login);

use testapi;

sub login {
    assert_and_click 'openqa-login';
    assert_screen 'openqa-logged-in';
}

1;
