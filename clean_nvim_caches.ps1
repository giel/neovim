# clean_nvim_caches

# Remove-Item  C:\Users\g.scharff\AppData\Local\nvim\plugin\packer_compiled.lua       
# Remove-Item  C:\Users\g.scharff\AppData\Local\nvim\plugin

# Remove-Item –path c:\myfolder\ remove-item * -include *.txt –recurse
Get-ChildItem C:\Users\g.scharff\AppData\Local\nvim-data\  –Recurse |  Remove-Item -Force -Confirm
