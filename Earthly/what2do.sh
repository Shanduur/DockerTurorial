echo "this file is only for documentation purposes, do not run it!"; exit 1

# build app with earthly
earthly +firmware.elf

# run tests with earthly
earthly +test
