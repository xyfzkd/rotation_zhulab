###
 # @Description: 
 # @Version: 
 # @School: Tsinghua Univ
 # @Date: 2020-01-08 21:04:16
 # @LastEditors  : Xie Yufeng
 # @LastEditTime : 2020-01-08 21:04:28
 ###
# 打开
function proxy_on() {
    export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
    export http_proxy="http://127.0.0.1:8118"
    export https_proxy=$http_proxy
    echo -e "已开启代理"
}
# 关闭
function proxy_off(){
    unset http_proxy
    unset https_proxy
    echo -e "已关闭代理"
}