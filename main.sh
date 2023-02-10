#function to create files
function createFiles() {
touch cs se ee ce
}

#function to add roll numbers according to the format {takes batch as argument}
function addRollNumbers() {
cd ..
cd $1
#in files: (cs se ee ce) 
for i in ./*
do
# 130 roll nmbrs tk add
for j in {1..130}
do
if [ $j -lt 10 ]
then
echo $1-00$j-$i >> $i
#awk '{gsub(/\/|\./,"")}1'
else if [ $j -lt 100 ]
then
echo $1-0$j-$i >> $i
else
echo $1-$j-$i >> $i
fi
fi
done
done
}

#function to remove the first 130 lines and filter . and /
function removeLines() {
cd ..
cd $1
awk '{gsub(/\/|\./,"")}1' cs >> cs
sed -i '1,130d' cs

awk '{gsub(/\/|\./,"")}1' se >> se
sed -i '1,130d' se

awk '{gsub(/\/|\./,"")}1' ee >> ee
sed -i '1,130d' ee

awk '{gsub(/\/|\./,"")}1' ce >> ce
sed -i '1,130d' ce
}

#check if directory is present or not and create if it isnt
if [ -d rollNumbers ]
then
echo "Directory is present"
else
echo "Directory isnt present, creating one!"
mkdir rollNumbers
echo "done, creating subdirectories now"
#move inro the directory and create subdirectories
cd rollNumbers
mkdir 19b 20b 21b 21sp 21f
#in every batch-subdirectory create major-files 

echo "done, creating files in eac subdirectory"
cd 19b
createFiles
cd ../20b
createFiles
cd ../21b
createFiles
cd ../21sp
createFiles
cd ../21f
createFiles
echo "done creating files"
fi

echo
echo "Adding roll numbers"
addRollNumbers 19b
addRollNumbers 20b
addRollNumbers 21b
addRollNumbers 21sp
addRollNumbers 21f
echo "done adding roll numbers"

echo
echo "Removing first 130 lines with . and /"
removeLines 19b
removeLines 20b
removeLines 21b
removeLines 21sp
removeLines 21f
echo "done removing lines"






























# #Function to create files
# createFiles() {
# touch cs se ee ce
# }

# #Function to add roll numbers to the files
# addRollNumbers() {
# local batch="$1"
# for i in cs se ee ce; do
# for j in $(seq -w 1 130); do
# echo "$batch-$j-$i" >> "$i"
# done
# done
# }

# #Function to remove the first 130 lines and filter . and /
# removeLines() {
# for i in cs se ee ce; do
# 	awk '{gsub(/\/|\./,"")}1' "$i" > "$i.tmp" && tail -n +131 "$i.tmp" > "$i" && rm "$i.tmp"

# done
# }

# #Create rollNumbers directory and subdirectories if not present
# if [ ! -d rollNumbers ]; then
# echo "Directory is not present, creating one!"
# mkdir rollNumbers
# echo "Done, creating subdirectories now"

# cd rollNumbers
# for subdir in 19b 20b 21b 21sp 21f; do
# mkdir "$subdir"
# done

# echo "Done, creating files in each subdirectory"
# for subdir in 19b 20b 21b 21sp 21f; do
# cd "$subdir"
# createFiles
# cd ..
# done
# echo "Done creating files"
# fi

# echo "Adding roll numbers"
# cd rollNumbers
# for subdir in 19b 20b 21b 21sp 21f; do
# cd "$subdir"
# addRollNumbers "$subdir"
# cd ..
# done
# echo "Done adding roll numbers"

# echo "Removing first 130 lines with . and /"
# for subdir in 19b 20b 21b 21sp 21f; do
# cd "$subdir"
# removeLines
# cd ..
# done
# echo "Done removing lines"
# #Function to create files
# createFiles() {
# touch cs se ee ce
# }

# #Function to add roll numbers to the files
# addRollNumbers() {
# local batch="$1"
# for i in cs se ee ce; do
# for j in $(seq -w 1 130); do
# echo "$batch-$j-$i" >> "$i"
# done
# done
# }

# #Function to remove the first 130 lines and filter . and /
# removeLines() {
# for i in cs se ee ce; do
# 	awk '{gsub(/\/|\./,"")}1' "$i" > "$i.tmp" && tail -n +131 "$i.tmp" > "$i" && rm "$i.tmp"

# done
# }

# #Create rollNumbers directory and subdirectories if not present
# if [ ! -d rollNumbers ]; then
# echo "Directory is not present, creating one!"
# mkdir rollNumbers
# echo "Done, creating subdirectories now"

# cd rollNumbers
# for subdir in 19b 20b 21b 21sp 21f; do
# mkdir "$subdir"
# done

# echo "Done, creating files in each subdirectory"
# for subdir in 19b 20b 21b 21sp 21f; do
# cd "$subdir"
# createFiles
# cd ..
# done
# echo "Done creating files"
# fi

# echo "Adding roll numbers"
# cd rollNumbers
# for subdir in 19b 20b 21b 21sp 21f; do
# cd "$subdir"
# addRollNumbers "$subdir"
# cd ..
# done
# echo "Done adding roll numbers"

# echo "Removing first 130 lines with . and /"
# for subdir in 19b 20b 21b 21sp 21f; do
# cd "$subdir"
# removeLines
# cd ..
# done
# echo "Done removing lines"

