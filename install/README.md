shift+f10
diskpart
list disk
select disk 0
clean
convert mbr
create partition primary size = 20480
format fs=ntfs quick
exit
exit
