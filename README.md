# yhaplorun

### Install
git clone https://github.com/beckbw/yhaplorun.git

### Build
docker build -t beckbw/yhaplorun .

### Run
docker run --rm -it -v ${PWD}:/tmp/work beckbw/yhaplorun /tmp/scripts/run_yhaplo.sh genome_file_from_23andMe.txt

### Output
root owned "yhaplo" directory
