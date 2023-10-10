package OpenQA::Wheel::OpenQATest::Install;
use strict;
use warnings;

use base 'Exporter';
our @EXPORT_OK = qw(bootstrap);
use experimental qw(signatures);

use testapi;

sub bootstrap (%args) {
    my $settings = $args{settings} || [];
#    zypper_call('in openQA-bootstrap');
    assert_script_run('zypper --no-cd -n in openQA-bootstrap');
    my $proxy_var = get_var('OPENQA_WEB_PROXY') ? 'setup_web_proxy=' . get_var('OPENQA_WEB_PROXY') . ' ' : '';
    my @settings;
    push @settings, 'setup_web_proxy=' . get_var('OPENQA_WEB_PROXY') if get_var('OPENQA_WEB_PROXY');
    push @settings, @$settings;
    my $cmd = '/usr/share/openqa/script/openqa-bootstrap';
    $cmd = "@settings $cmd" if @settings;
    assert_script_run($cmd, 4000);
    assert_script_run('skip_suse_specifics=1 skip_suse_tests=1 /usr/share/openqa/script/openqa-bootstrap', timeout => 1200);
}

1;
