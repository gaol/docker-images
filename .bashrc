# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

PS1="\[\033[01;31m\]\h\[\033[01;34m\] \w\[\033[31m\]\[\033[00m\] \$ "  

alias l='ls -l'
alias ll='ls -lah'
alias cls='clear'

#
# Set up workspace home
#
WORKSPACE_HOME=/
export WORKSPACE_HOME

# ANT
ANT_HOME="${WORKSPACE_HOME}softwares/ant/default"
export ANT_HOME

PATH=$ANT_HOME/bin:$PATH
export PATH

# MVN
MVN_HOME="${WORKSPACE_HOME}softwares/maven/default"
export MVN_HOME
M2_HOME="${WORKSPACE_HOME}softwares/maven/default"
export M2_HOME
MAVEN_OPTS="-Xms512M -Xmx1024M -Dfile.encoding=UTF-8"
export MAVEN_OPTS

PATH=$MVN_HOME/bin:$PATH

export PATH

