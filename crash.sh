#首先把crash文件、ipa、dsym放到同一文件夹，之后跑此脚本+文件夹地址，生成后的n.crash即为解析后的crash文件
#

xcode_name="Xcode.app"

if [ "$1" = "" ]; then
    echo "首先把crash文件、ipa、dsym放到同一文件夹，之后跑此脚本+文件夹地址，生成后的n.crash即为解析后的crash文件"
    echo "eg:"
    echo "bash crash.sh ~/Desktop/crash"
    
    exit 0
fi

if [[ -e $1 ]]
then
	echo 'path OK'
else
	echo "未找到此文件夹，请确认文件夹路径"
	exit 0
fi

cd $1

cp *.ipa tmp.zip
unzip tmp.zip
cp -R Payload/*.app .

cp -R *.dSYM tmp.app.dSYM

cp *.crash tmp.crash

sleep 1

export DEVELOPER_DIR="/Applications/$xcode_name/Contents/Developer"
/Applications/$xcode_name/Contents/SharedFrameworks/DTDeviceKitBase.framework/Versions/A/Resources/symbolicatecrash tmp.crash tmp.app.dSYM > crash.log

sleep 1

rm -Rf tmp.*
rm -Rf Payload
#rm -Rf *.app
