tell application "Terminal" to do script "cd ~/Documents/Programming/CourseWork/cw2/server && npm run start"
tell application "Terminal" to do script "cd ~/Documents/Programming/CourseWork/cw2/client"
tell application "Terminal" to do script "cd ~/Documents/Programming/CourseWork/cw2/admin && au run --open"
tell application "Terminal"
    activate
    do script "cd ~/Documents/Programming/CourseWork/cw2/server && npm run build:watch" in window 1
    tell application "System Events" to keystroke "t" using command down
    do script "cd ~/Documents/Programming/CourseWork/cw2/client && flutter pub run build_runner watch --delete-conflicting-outputs" in window 1
end tell