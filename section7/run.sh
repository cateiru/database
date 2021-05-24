if [ $1 ]; then
  dir_path=$(cd $(dirname $0); pwd)
  export CLASSPATH=.:$dir_path/libs/postgresql-42.2.20.jar
  java $1
  echo $a
else
  echo "Please args"
fi
