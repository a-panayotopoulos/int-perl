use 5.006;
use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'NatLang',
    license             => 'artistic_2',
    dist_author         => q{Alex Panayotopoulos <alexp@fake.com>},
    dist_version_from   => 'lib/NatLang.pm',
    release_status      => 'stable',
    configure_requires => {
        'Module::Build' => 0,
    },
    build_requires => {
        'Test::More' => 0,
    },
    requires => {
        #'ABC'              => 1.6,
        #'Foo::Bar::Module' => 5.0401,
    },
    add_to_cleanup     => [ 'NatLang-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
