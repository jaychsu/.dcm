# Thrid-party
# ======
export JAVA_HOME=$(/usr/libexec/java_home)

# Enviroment
# ======
export PATH="\
$HOME/bin:\
/usr/local/bin:\
/usr/local/sbin:\
$PATH:\
$HOME/.rvm/bin:\
$JAVA_HOME/bin:\
/usr/local/opt/gnupg/libexec/gpgbin\
"
export EDITOR='vim'

# Proxy
# ======
PROXY_URL=http://127.0.0.1:6152
export http_proxy=$PROXY_URL
export https_proxy=$PROXY_URL
