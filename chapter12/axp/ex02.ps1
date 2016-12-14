$env:MODULE_STARTER_DIR="$pwd"
cp .\ex02.conf config
pushd ..\..\modules\axp
ppm install Module::Starter
module-starter --mb --module="Animal" --force
cd Animal
perl Build.PL
./Build
./Build test
popd