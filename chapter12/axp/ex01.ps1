pushd ..\..\modules\axp
ppm install Module::Starter
module-starter --mb --module="Animal" --author="Alex Panayotopoulos" --email=alex.p@fake.com --force
cd Animal
perl Build.PL
./Build
./Build test
popd