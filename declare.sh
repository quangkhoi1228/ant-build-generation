#project name quy định tên thư mục lib, xml, jar 
export project_name=tradingsystemweb

#project dir là thư mục chứa source code
export project_dir=/Volumes/home/Project/tradingsystemweb/git/tradingsystemweb

#main class là đường dẫn đến class Main
export main_class=com.tradingsystemweb.main.TradingSystemWebMain

#Thư mục chứa file xml kết quả
export output_dir=/Volumes/home/Project/ant-build-generation/git/ant-build-generation/out

#workspace là folder chứa workspace của project
export workspace=/Volumes/home/Project/workspace

#quy định đường dẫn đến các file jar được import ngoài maven nếu không có thì để là () - xóa chuỗi phía trong
declare -a project_jar_directory_dependencies=("/Volumes/home/Project/aladin/git/aladin/aladin/lib/shinobiserver.jar")