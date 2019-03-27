#!/bin/bash
if [[ $1 = 'run' ]];
  then
      cd /home/software_install_dir/MATLAB/R2018a/$3/
      matlab -nodisplay < /home/software_install_dir/MATLAB/R2018a/$3/calling.m
  elif [[ $1 = 'list' ]];
    then
      echo "$4/Subjects2Process.txt"
      file="$4/Subjects2Process.txt"
      for subjects in `ls "$4"`
        do
                subject=${subjects##*/}
                echo $subject >> $file
        done
  elif [[ $1 = 'create_xml' ]];
    then
    file="$5/data-descriptor.xml"
    echo '<Data Path="/home/software_install_dir/MATLAB/R2018a" Workspace="'$3'" Subject="'$4'/'$5'"></Data>' >> $file
  elif [[ $1 = 'delivery' ]];
    then
      tar fcz /home/software_install_dir/MATLAB/R2018a/$3.tar.gz --absolute-names /home/software_install_dir/MATLAB/R2018a/$3/results/
      if [ -d "/data3_260T/DATA/Datasets/Data_Proccesaded/QEEGT/$2" ]
       then
           mv /home/software_install_dir/MATLAB/R2018a/$3.tar.gz /data3_260T/DATA/Datasets/Data_Proccesaded/QEEGT/$2
       else
           mkdir /data3_260T/DATA/Datasets/Data_Proccesaded/QEEGT/$2
           mv /home/software_install_dir/MATLAB/R2018a/$3.tar.gz /data3_260T/DATA/Datasets/Data_Proccesaded/QEEGT/$2
       fi
  elif [[ $1 = 'clean' ]];
    then
        cd /home/software_install_dir/MATLAB/R2018a/
        mv -f $3 Jenkins_Trash/
  else
      echo "Invalid action"
  fi
