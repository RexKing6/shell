#!/bin/sh
#	***************************************************
#		^> File Name: rpm-check.sh
#		^> Author: T-Rex
#		^> Mail: 1010026261@qq.com
#		^> Created Time: 2016/05/28 - 14:48:46
#	***************************************************

#这个脚本的目的是为了描述,列表和确定是否可以安装一个rpm包.
#在一个文件中保存输出.

SUCCESS=0
E_NOARGS=65

if [ -z "$1" ] #判断用户是否有自己输入参数
then
	echo "Usage: `basename $0` rpm-file"
	exit $E_NOARGS
fi

{
	echo
	echo "Archive Description:"
	rpm -qpi $1
	echo
	echo "Archive Listing:"
	rpm -qpl $1
	echo
	rpm -i --test $1
	if [ "$?" -eq $SUCCESS ]
	then
		echo "$1 can be installed."
	else
		echo "$1 cannot be installed."
	fi
	echo	
}> "$1.test"

echo "Results of rpm test in file $1.test"

exit 0
