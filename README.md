<!--
 * @Description: 
 * @Version: 
 * @School: Tsinghua Univ
 * @Date: 2020-01-05 16:04:09
 * @LastEditors  : Xie Yufeng
 * @LastEditTime : 2020-01-08 21:18:27
 -->
# rotation_zhulab
***
## Record work every week and save in `./Progress`
### Dec_28_2019
#### MSA-based approach development
Selecting the appropriate mutation site based on the information of protein evolution
* mutiple sequence alignment
* distance map --> hydrogen bond ditinguish
* 3D visualization
#### MSA-independent approach exploration
information beyond protein evolution: mutation?

see detail in 

<object data="./Progress/Dec_28_2019.pdf" width="700px" height="700px"> 
    <embed src="./Progress/Dec_28_2019.pdf"> 
     This browser does not support PDFs. Please download the PDF to view it: <a href="./Progress/Dec_28_2019.pdf">Download PDF</a>.</p> 
    </embed> 
</object> 

#### server&cluster env
##### cluster
install `rosetta` on cluster, `pyrosetta` failed because of error `GLIBC.2.17 not found`, contact Anbao and solve the problem
##### server
install `jupyterhub` and we can type `http://166.111.156.22:8000` on browsers and sign in our server. Do visualization work as we can: like `matplotlib` plotting
<div  align="center"> 
<img src="./Image/WechatIMG6.png" width = "500" height = "400" alt="图片名称" align = center />
</div>


#### peer
Yunxin Xu in Haipeng Gong lab does similar work: de novo protein folding by `pyrosetta` and `trRosetta`, chat with him to promote my work
### Jan_06_2019
aim: mutate, Ile, split(know what is split, previous method about split in reading_list)
paper reading about split 
#### MSA-based approach 
* mutiple sequence alignment (experienced but to do)
* distance map --> hydrogen bond ditinguish (to do, not too hard)
* 3D visualization (doing)

##### server (`166.111.156.22`)

`teamviewer`(desktop remote) linux service
`pymol` 
so we can open `PDB` file on server and have a vision of protein 3D structure 
##### trRosetta
from sequence file to PDB file 
```
python trRosetta.py T1008.npz T1008.fasta model.pdb
```
`T1008.npz` is like distance map, can also derive from fasta
so we can have 3D visualization of mutant protein.
#### website (zhulab)
software | function
-|-
nginx |  can browse `IP:port` to get data in computer (modify `nginx.conf`)
Vscode | install `live server` plugin to see website in-time and modify `html` file and see direct effect

update new `html` file to the website-server

### Jan_08_2019
* privoxy (折腾ing)

software | install | function
-|-|-
shadowsocks | `pip install shadowsocks` | sock5  can use browserVPN but terminalVPN blocked, `curl -x` allowed  
privoxy | https://www.privoxy.org download make & make install | sock5->http/https
three config_file
edit `shadowsocks.json`
```
{
"server":"34.85.87.130",
"server_port":2000,
"local_address": "127.0.0.1",
"local_port":1080,
"password":"**********",
"timeout":600,
"method":"aes-256-cfb"
}
```
run `nohup sslocal -c shadowsocks.json &`
you can `curl(maybe +x)` in terminal, because `curl` support `socks5`, to support `http`, install privoxy

edit `config` in privoxy HOMEPATH/etc  
```
# 设置转发到本地的 socks5 代理客户端端口
forward-socks5t   /               127.0.0.1:1080 .
# 设置 privoxy 监听任意 
listen-address  127.0.0.1:8118
```
run `./privoxy config` and type `ps aux | grep privoxy` to see
```
xyf      20484  0.0  0.0  15908  1204 ?        Ss   20:39   0:00 ./privoxy config
```

```privoxy.sh
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
```
type `proxy_on` and you can `wget www.google.com`

***
## learning
Data structure
Parallel Computing

