use strict;
use inc::Module::Install;

print <<NOTICE;

\a--------------------------------------------------------------
This distribution and associated tools have been deprecated.

Please investigate POE::Component::SmokeBox and 
App::SmokeBox::Mini instead.

Thanks.
--------------------------------------------------------------

NOTICE

sleep 5;

name 'POE-Component-CPANPLUS-YACSmoke';
author 'Chris Williams <chris@bingosnet.co.uk>';
license 'perl';
auto_license holder => 'Chris Williams';
version_from 'lib/POE/Component/CPANPLUS/YACSmoke.pm';
abstract_from 'lib/POE/Component/CPANPLUS/YACSmoke.pm';
readme_from 'lib/POE/Component/CPANPLUS/YACSmoke.pm';
perl_version '5.006';
author_tests 'xt';
install_script 'bin/miniyacsmoker';
build_requires 'Test::More' => 0.47;
requires 'Storable' => 0;
requires 'POE' => 1.0001;
requires 'POE::Wheel::Run' => 0;
requires 'File::Spec' => 0;
requires 'Digest::MD5' => 0;
if ( win32 ) {
  requires 'Win32::Process' => 0;
  requires 'Win32::Job' => 0;
}
else {
  unless ( can_use 'Proc::ProcessTable' ) {
    requires 'Proc::ProcessTable' => 0 if 
       prompt( 'Do you want to enable optional Proc::ProcessTable support [y/N]?', 'N' )
	 =~ /^Y/i;
  }
  else {
     warn "You already have optional module Proc::ProcessTable installed, skipping dialogue\n";
  }
  unless ( can_use 'IO::Pty' ) {
    requires 'IO::Pty' => 0 if 
       prompt( 'Do you want to install IO::Pty, it is highly recommended that you do [Y/n]?', 'Y' )
	 =~ /^Y/i;
  }
  else {
     warn "You already have IO::Pty installed, excellent.\n";
  }
}
auto_provides;
githubmeta;
WriteAll();
