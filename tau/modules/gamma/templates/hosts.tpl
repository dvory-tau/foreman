127.0.0.1       localhost       localhost.localdomain localhost4 localhost4.localdomain4
::1     localhost       localhost.localdomain localhost6 localhost6.localdomain6


192.168.200.247 ddn7700-c0
192.168.200.251 ddn7700-c1

192.168.200.250 gddn250-ilo
192.168.200.249 gddn249-ilo
192.168.100.250 gddn250
192.168.100.249 gddn249
10.0.0.250      gddn250-ib
10.0.0.249      gddn249-ib
10.0.0.253      gamma-ib

192.168.200.253 gamma gamma.tau.ac.il



192.168.100.222 cygnus-internal
132.66.102.204 cygnus



<% (1..73).each do |i| -%>
192.168.100.<%= i %> compute-0-<%= i %>.local compute-0-<%= i %>.gamma compute-0-<%= i %>
<% end -%>

<% (1..73).each do |i| -%>
10.0.0.<%= i %> compute-0-<%= i %>-ib.local compute-0-<%= i %>-ib
<% end -%>

<% (1..73).each do |i| -%>
192.168.200.<%= i %> compute-0-<%= i %>-bmc
<% end -%>
