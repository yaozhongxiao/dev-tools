# 公网ip/内网IP
echo "     external ip  : internal ip"
echo "     ------------------------------ "
echo "s1-> 47.103.74.110 : 172.19.88.101"
echo "s2-> 47.103.81.27  : 172.19.88.100"

# 压力机：
echo "anchor"
echo "s0-> 47.102.200.170 : 10.4.7.145"
echo ""
echo "----------------------------------"
option=$1
case ${option} in
   s0) ssh root@47.102.200.170
       ;;
   s1) ssh root@47.103.74.110
       ;;
   s2) ssh root@47.103.81.27
       ;;
   *)  echo "unknown ip address for ${option}"
esac
