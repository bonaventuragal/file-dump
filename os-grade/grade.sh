WEEK=$1

if [ -z $WEEK ] ; then
  echo "Please specify the week you want to check (e.g. bash grade.sh 2)"
  exit 1
fi

if [ $WEEK -lt 0 ] || [ $WEEK -gt 11 ] ; then
  echo "Invalid week (0..11 only)"
  exit 1
fi

if [ $WEEK -lt 10 ] ; then
  WEEK=0$1
fi

rm -rf $USER
rm -rf $USER.tar.bz2.txt
rm -rf grade

wget -c https://os.vlsm.org/Log/$USER.tar.bz2.txt
gpg -o grade -d $USER.tar.bz2.txt
tar xf grade
cd $USER/DW$WEEK/
clear
more *

cd ../../
rm -rf $USER.tar.bz2.txt
rm -rf grade
