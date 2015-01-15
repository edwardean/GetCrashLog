# GetCrashLog
Get iOS crash log by using ipa/dSYM/.crash files

You should move your ipa file, dSYM file and crash file into a folder, then open terminal and type: 

bash script-path crash-folder-path, which like this:

    eg:
    bash crash.sh ~/Desktop/crash

After the script done, you can get readable crash stack in crash.log
