127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6

<% (1..99).each do |i| -%>
192.168.200.<%= i %> compute-0-<%= i %>.local compute-0-<%= i %>.astro compute-0-<%= i %>
<% end -%>

<% (9..99).each do |i| -%>
10.0.0.<%= i %> compute-0-<%= i %>-ib.local compute-0-<%= i %>-ib
<% end -%>

192.168.200.253 astrophys.tau.ac.il astrophys.local astrophys
10.0.0.253 astrophys-ib.local astrophys-ib

192.168.200.252 astrophys2.local astrophys2
10.0.0.252 astrophys2-ib.local astrophys2-ib

10.0.0.8 hp-storage-file1.local hp-storage-file1

192.168.200.253 astro-headnode-def.local
