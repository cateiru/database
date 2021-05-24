if [ $1 ]; then
  dir_path=$(cd $(dirname $0); pwd)
  export CLASSPATH=$dir_path/libs/postgresql-42.2.20.jar:.
  exec `java $1`
else
  echo "Please args"
fi
