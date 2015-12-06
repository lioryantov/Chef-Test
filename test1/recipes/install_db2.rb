cookbook_file "/var/tmp/db2_test.sh" do
    source "db2_test.sh"
    mode 0755
    owner "root"
    group "root"
    action :create
end

ruby_block "test-bobo-db2" do
    block do
      my_stat=system '/var/tmp/db2_test.sh'
      printf "********************** my_stat=[%s]\n",my_stat
      case my_stat
         when true 
            printf("\033[32m%s\n\033[0m", "  db2_test.sh completed successfully.")
         else 
            printf("\033[31m%s\n\033[0m", "  db2_test.sh failed.")
      end
   end
end





