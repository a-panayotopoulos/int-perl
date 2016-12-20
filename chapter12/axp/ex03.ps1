$env:MODULE_STARTER_DIR="$pwd"
cp .\ex03.conf config
pushd ..\..\modules\axp
ppm install Module::Starter
ppm install Module::Starter::AddModule
module-starter --module=Cow --dist=Animal
cd Animal
perl Build.PL
./Build
./Build test
popd