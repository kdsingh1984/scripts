#!/usr/bin/python -tt
import sys,socket,getopt
def subnet_2_maskbit(subnet):
  host_network_bit=[]
  binary_str=""
  for bits in subnet.split('.'):
    binary_str=binary_str+str(bin(int(bits)).split('b')[1])
  network_bit=sum(map(lambda x: int(x),list(binary_str)))
  host_bit=32-network_bit
  host_network_bit.append(network_bit)
  host_network_bit.append(host_bit)
  return host_network_bit

def ips_in_range(hostbits):
  ips=1
  for i in range(hostbits):
    ips=ips*2
  return ips

def get_ip_range(ip,hostbits):
#  bit_list=[]
#  [bit_list.append(1) for i in range(hostbits)]
#  rangesize=int("".join(map(lambda x: str(x),bit_list)),2)
  rangesize=ips_in_range(hostbits)
  for bits in range(0,255,rangesize):
    range_list=range(bits,bits+rangesize)
    if ip in range_list:
      return range_list
      break

#def get_range(num,bits):
#  for bit in range(0,256,bits):
#    bit_range_list=range(bit,bit+bits)
#    if num in bit_range_list:
#      return bit_range_list
#      break

def maskbit_2_subnet(maskbit):
  bit_list=[]
  [bit_list.append(1) for i in range(maskbit)]
  remaining_bits=32-maskbit
  [bit_list.append(0) for i in range(remaining_bits)]
  split_list=[bit_list[i:i+8] for i in range(0,len(bit_list),8)]
  subnet_list=[int("".join(map(lambda x: str(x),list)),2) for list in split_list]
  subnet=".".join(map(lambda x: str(x),subnet_list))
  return subnet

def get_ip_list(network,subnet):
  ip_list=[]
  [networkbits,hostbits] = subnet_2_maskbit(subnet)
  if hostbits <= 8:
    ip=network.split('.')[3]
    net=".".join(map(lambda x: str(x),network.split('.')[0:3]))+'.'
    ip_range=get_ip_range(int(ip),int(hostbits))
    for ips in ip_range:
      ip_list.append(net+str(ips))
  elif hostbits > 8 and hostbits <= 16:
    ip_last_bit=network.split('.')[3]
    ip_secondlast_bit=network.split('.')[2]
    net=".".join(map(lambda x: str(x),network.split('.')[0:2]))+'.'
    ip_last_range=get_ip_range(int(ip_last_bit),8)
    ip_secondlast_range=get_ip_range(int(ip_secondlast_bit),int(hostbits-8))
    for secondlast in ip_secondlast_range:
      for last in ip_last_range:
        ip_list.append(net+str(secondlast)+'.'+str(last))
  ip_list.pop(0)
  ip_list.pop()
  return ip_list

def usage():
  print sys.argv[0] +": -s subnet"
  print "Example: "+sys.argv[0] +": -n 192.168.1.0/22 or 192.168.1.0/255.255.255.0"

def resolv(network):
  [network,netmask] = network.split('/')
  if '.' in netmask:
    subnet=netmask
  else:
    subnet=maskbit_2_subnet(int(netmask))
  for ip in get_ip_list(network,subnet):
    try:
      print socket.gethostbyaddr(ip)[0]
    except:
      print ip+": Does not in DNS"

def list_ip(network):
  [network,netmask] = network.split('/')
  if '.' in netmask:
    subnet=netmask
  else:
    subnet=maskbit_2_subnet(int(netmask))
  for ip in get_ip_list(network,subnet):
    print ip

def main():
  try:
    opts,args = getopt.getopt(sys.argv[1:], 'hn:s:m:l:',['help','network','subnet','maskbit','list'])
  except getopt.GetoptError as err:
    print str(err)
    usage()
    sys.exit(2)

  for opt,arg in opts:
    if opt in ('-h' or '--help'):
      usage()
    elif opt in ('-n' or '--network'):
      resolv(arg)
    elif opt in ('-s' or '--subnet'):
      print '/'+subnet_2_maskbit(arg)[0]
    elif opt in ('-m' or '--maskbit'):
      print maskbit_2_subnet(int(arg))
    elif opt in ('-l' or '--list'):
      list_ip(arg)


if __name__ == "__main__":
  main()
