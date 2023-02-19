
ch="y"
while [ $ch="y" ]
do
clear
echo "1.Create Database"
echo "2.Show Database"
echo "3.Insert Student Info"
echo "4.Delete Record"
echo "5.Modify Recorded"
echo "6.Search Info"
echo "7.exit"

echo "Enter your choice"
read choice

case $choice in
1)
echo "Enter Student ID:"
read id
echo "Enter Student Name"
read name
echo "Enter Section:"
read section
echo "Enter Dept.:"
read dept
echo "Blood Group:"
read blood
record="$id $name $section $dept $blood"
echo $record>student
;;

2) echo "View Database"
cat student
;;

3) echo "Enter Student ID:"
read id
echo "Enter Student Name"
read name
echo "Enter Section:"
read section
echo "Enter Dept.:"
read dept
echo "Blood Group:"
read blood
record="$id $name $section $dept $blood"
echo $record>>student
;;

4) echo "Enter Student ID:"
read id
grep ^$id student
if [ $? -ne 0 ];
then
echo "Record for this ID not exist"
else
grep -v $id student>>temp
cp temp student
echo "Record Deleted!!"
fi
;;

5) echo "Enter Student ID:"
read id1
grep ^$id1 student
if [ $? -ne 0 ];
then
echo "Record for this ID not exist"
else
echo "Enter Student Name"
read name
echo "Enter Section:"
read section
echo "Enter Dept.:"
read dept
echo "Blood Group:"
read blood
record="$id1 $name $section $dept $blood"
var=`grep -n ^$id1 student | cut -c 1`
echo $var
var1=` expr $var - 1`
head -$var1 student>tmp
echo $record>>tmp
var3=`wc -l <student`
var2=` expr $var3 - $var`
tail -$var2 student>>tmp
cp tmp student
fi
;;

6) echo "Enter Student ID:"
read id
echo "Student Details:"
grep ^$id student
;;

7) exit
;;
*) echo "Enter right choice:"
esac
echo -ne "\n Do you want to continue[y/n]:"
read ch
done

