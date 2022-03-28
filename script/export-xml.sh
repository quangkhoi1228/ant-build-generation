export project_name=$project_name
export workspace=$workspace
export main_class=$main_class
export output_dir=$output_dir

# brew install maven

echo "$project_name"

cat ../template/template.xml > test.xml