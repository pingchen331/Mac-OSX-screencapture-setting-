#!/bin/bash
#mantainer:Ping-Chen, Tasi
#Email: pingchen0331@gmail.com
#Version:Ver-1.0
varKey=0
while [ $varKey -ne "4" ]
do
	clear
	echo "=============screencapture location setting==========="
	echo "(1)Change screencapture defualt saving location"
	#echo "(1)更改預設儲存路徑"
	echo "(2)Change screencapture default saving name"
	#echo "(2)更改檔案預設名稱"
	echo "(3)Change screencapture default saving format"
	#echo "(3)更改檔案預設儲存格式"
	echo "(4)EXIT"
	#echo "(4)結束"
	echo "======================================================"
	read -n 1 -p "Please choose the item: " varKey
case $varKey in 
	1 )
		echo ""
		#read defpath
		defpath=`defaults read com.apple.screencapture location`
		#echo "$defpath"
		echo "Please enter the screencapture location:"
		#echo "更改螢幕截圖預設儲存路徑："
		echo "[defualt: $defpath] | [EXIT: Ｑ]"
		read -p "Please enter or drag a directory here：" picpath
		#read -p "請輸入路徑或直接拖拉資料夾：" picpath
		defpath="/Users/$USER/Desktop"
		#echo "$defaultpath"
		picpath="${picpath:-$defpath}"
		#echo "$picpath"
		if [ $picpath == "Q" ];then
			echo "Exit!"
			varKey=0
		elif [ ! -d $picpath ]; then
			echo "directory does not exist!! try again!!"
			#echo "目錄不存在，請重新輸入"
			varKey=1
		else
			`defaults write com.apple.screencapture location $picpath`
			`killall SystemUIServer`
			echo -e "success!!\n screencapture location now :$picpath"
			varKey=0
		fi
		;;
	2 )
		echo ""
		read -p "Please enter screencapture name you want[EXIT: Q]:" name
		if [ -z $name ];then
			nowname=`defaults read com.apple.screencapture name`
			echo "nothing changes, default screencapture name now is $nowname"
			varKey=0
		elif [ $name == "Q" ];then
			echo "Exit!"
			varKey=0
		else	
			`defaults write com.apple.screencapture name $name`
			`killall SystemUIServer`
			nowname=`defaults read com.apple.screencapture name`
			echo "defualt screencapture name change to $nowname"
			varKey=0
		fi
		;;
		
	3 )
		format=`defaults read com.apple.screencapture type`
		clear
		echo "========CHOOSE A FORMAT======="
		echo "(1)jpg"
		echo "(2)png"
		echo "(3)bmp"
		echo "(4)pdf"
		echo "(5)jp2"
		echo "(6)tif"
		echo "(7)pict"
		echo "(8)tga"
		echo "(9)show default"
		echo "(0)QUIT"
		echo "=============================="
		read -n 1 -p "choose a screencapture format: " forno
		case $forno in
			0)
				echo -e "\nQUIT"
				varKey=0
				;;
			1)
				echo ""
				format=jpg
				`defaults write com.apple.screencapture type $format`
				`killall SystemUIServer`
				echo "default screencapture format change to $format"
				varKey=3
				;;
			2)
				echo ""
				format=png
				`defaults write com.apple.screencapture type $format`
				`killall SystemUIServer`
				echo "default screencapture format change to $format"
				varKey=3
				;;
			3)
				echo ""
				format=bmp
				`defaults write com.apple.screencapture type $format`
				`killall SystemUIServer`
				echo "default screencapture format change to $format"
				varKey=3
				;;
			4)
				echo ""
				format=pdf
				`defaults write com.apple.screencapture type $format`
				`killall SystemUIServer`
				echo "default screencapture format change to $format"
				varKey=3
				;;
			5)
				echo ""
				format=jp2
				`defaults write com.apple.screencapture type $format`
				`killall SystemUIServer`
				echo "default screencapture format change to $format"
				varKey=3
				;;
			6)
				echo ""
				format=tif
				`defaults write com.apple.screencapture type $format`
				`killall SystemUIServer`
				echo "default screencapture format change to $format"
				varKey=3
				;;
			7)
				echo ""
				format=pict
				`defaults write com.apple.screencapture type $format`
				`killall SystemUIServer`
				echo "default screencapture format change to $format"
				varKey=3
				;;
			8)
				echo ""
				format=tga
				`defaults write com.apple.screencapture type $format`
				`killall SystemUIServer`
				echo "default screencapture format change to $format"
				varKey=3
				;;
			9)
				echo ""
				echo "default format is $format"
				varKey=3
				;;
			*)
				echo ""
				echo "Wrong input! try again! "
				varKey=3
				;;


		esac
		;;
	4 )
		echo -e "\nQUIT"
		varKey=4
		;;
	* )
		echo -e "\nWrong input!\nTry again!"
		#echo -e "輸入錯誤！\n請重新選擇！"
		varKey=0
		;;
esac
	read -n 1 -p "Press any key to continue..."
done
exit 0
