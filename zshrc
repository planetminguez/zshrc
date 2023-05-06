####Doc Vincents zsh config
###
export PATH=/usr/local/bin:/usr/bin:/bin:/sbin:/usr/local/sbin:/usr/sbin:/Users/minguez/usr/bin:

export HISTSIZE=50
##########################################
export CLICOLOR=1
alias ls='ls -G'
alias ll='ls -lG'
##############################---> My alias
alias ghidra='ghidraRun'
alias SDK='cd /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk';
alias iSDK='cd /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk';
alias coderun='cd /private/var/folders/pw/cgq_81756qq5kk_3wr80w4w00000gn/T/CodeRunner;pwd'
alias igcc='xcrun -sdk iphoneos gcc -Wall -arch armv7 -arch arm64';
alias igcc64='xcrun -sdk iphoneos gcc -Wall -arch arm64';
alias igcc64e='xcrun -sdk iphoneos gcc -Wall -arch arm64e';
alias ig++='xcrun -sdk iphoneos g++ -Wall -arch armv7 -arch arm64';
alias ig++64='xcrun -sdk iphoneos g++ -Wall -arch arm64';
alias ig++64e='xcrun -sdk iphoneos g++ -Wall -arch arm64e';
alias iclang='xcrun -sdk iphoneos gcc -Wall';
alias iclang++='xcrun -sdk iphoneos g++ -Wall';
alias xcbuild='xcodebuild clean build CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO';
alias makeipa='zip -x .DS_Store -qr9 Output.ipa Payload'
alias desk='cd Desktop;pwd'
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias checkcrypt="cointop"
alias getpass='wifi-password'
alias tozsh='chsh -s /bin/zsh'
alias tobash='chsh -s /bin/bash'
alias coderunners='cd /private/var/folders/pw/cgq_81756qq5kk_3wr80w4w00000gn/T/CodeRunner;pwd'
alias mm='cd ~'
alias shell='echo $SHELL'
alias xcdir='open ~ /Users/minguez/Library/Developer/Xcode/DerivedData'
alias sdkdir='cd /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs'
alias aske='asciinema'
alias pythonpkg='cd /usr/local/Cellar/python@3.10/3.10.10/Frameworks/Python.framework/Versions/3.10/lib/python3.10 && pwd'
alias mktxt='echo "This is a test file." > test.txt && cat test.txt'
alias gcccheck='echo "" | gcc -E -Wp, -v -'
alias python="python3"
alias sshkali='ssh docvinny@10.211.55.16'
alias sitepackages='cd /usr/local/lib/python3.11/site-packages && pwd'
alias bk='cd ../'
alias bkk='cd ../../'
##--->iOS Stuff
isign()
{
    f=('-s' '-');
    if [ $# -ge 2 ]; then
        f+=('--entitlements' "$2");
    fi;
    codesign "${f[@]}" "$1";
}
ibuild()
{
    xcodebuild clean build CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO -sdk iphoneos;
}
#########################################################################################################################################################
#
#########################################################################################################################################################
plugins=(zsh_codex)
bindkey '^X' create_completion

######################################################################
##------>  Update PIP Function
######################################################################
updatepips() {
    if ! which pip3 &>/dev/null; then return; fi

    echo -e "\n${GREEN}Updating Python 3.X pips${CLEAR}"
    pip3 freeze - local | grep -v ‘^\-e’ | cut -d = -f 1 | xargs pip3 install -U
}

########JAVA_SCRIPT********#########
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


###########JAVA_SCRIPT_NVM_STUFF*********###############

##->export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
##->[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"


############## PNG TO ICON #################-->usage == png2 this.png
png2() {
    local i="${1}" o="${2:-${1:r}.ico}" s="${png2ico_size:-256}"
    convert -resize x${s} -gravity center -crop ${s}x${s}+0+0 "$i" -flatten -colors 256 -background transparent "$o"
}
