package File::TestFile;

use base qw(Test::Class);
use Test::More;
use Test::File;

sub windows_test : Test  {
  return "Test for Windows only" unless $^O eq 'MSWin32';
  file_exists_ok( 'C:\windows\system32\drivers\etc\hosts' );
}

sub linux_test : Test  {
  return "Test for Linux only" unless $^O eq 'linux';
  file_exists_ok( '/etc/hosts' );
}

1;
