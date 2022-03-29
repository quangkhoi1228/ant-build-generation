export project_name=$project_name
export project_dir=$project_dir
export workspace=$workspace
export main_class=$main_class
export output_dir=$output_dir


cd $project_dir

brew install maven

#create dependency list file 
#maven jar
export dependency_list_file_name=$output_dir/${project_name}_dependency_list.csv
rm $dependency_list_file_name
mvn dependency:build-classpath -Dmdep.outputFile=$dependency_list_file_name
sed -i -e 's/:/\'$'\n''/g' $dependency_list_file_name
rm $dependency_list_file_name-e

#other jar
declare -a  project_jar_directory_dependencies1=$project_jar_directory_dependencies
for file in "${project_jar_directory_dependencies1[@]}"
do
    echo "\n$file" >> $dependency_list_file_name
done

# create 
export jar_file_in_lib_folder_class_path=""
export jar_file_in_user_maven_folder_class_path=""
while read line; 
do
    # reading each line
    jar_file_name="$(basename -- $line)"
    jar_file_in_user_maven_folder_class_path+="\n<copy file=\"$line\" todir=\"\${dir.jarfile}/${project_name}_lib\"/>"
    jar_file_in_lib_folder_class_path+=" ${project_name}_lib/$jar_file_name"
done < $dependency_list_file_name


export xml_file_name=build_${project_name}.xml
cd $output_dir
rm $xml_file_name
cat ../template/template.xml > $xml_file_name

sed -i -e 's/\${{project_name}}/'${project_name}'/g' $xml_file_name
sed -i -e 's/\${{main_class}}/'${main_class}'/g' $xml_file_name
sed -i -e "s|\${{workspace}}|${workspace}|g" $xml_file_name
sed -i -e "s|\${{jar_file_in_lib_folder_class_path}}|${jar_file_in_lib_folder_class_path}|g" $xml_file_name
sed -i -e "s|\${{jar_file_in_user_maven_folder_class_path}}|${jar_file_in_user_maven_folder_class_path}|g" $xml_file_name

rm $xml_file_name-e

echo "done"