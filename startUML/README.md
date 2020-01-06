# StarUML > 3.0.1
升级到3.0.1之后，验证文件不再放在本地的目录中了，而是放在了打包文件里面了，所以需要先解压出应用，然后替换文件之后，再打包回去

## install asar
```
npm install -g asar
```

## unpack app.asar
$ cd /Applications/StarUML.app/Contents/Resources
$ ls -la 
```
├── StarUML.icns
├── am.lproj
├── app-update.yml
├── app.asar
```
$ asar extract app.asar app

## modify license-manager
$ vim app/src/engine/license-manager.js
```
124 
125   checkLicenseValidity () {
126     this.validate().then(() => {
127       setStatus(this, true)
128     }, () => {
129       setStatus(this, true)
          // HACK(zhongxiao.yzx) : invalidate licence check
130       // setStatus(this, false)
131       // UnregisteredDialog.showDialog()
132     })
133   }
```

## pack app.asar
$ asar pack app app.asar


## restart StartUML

## Reference
[1]. StarUML Cracker : https://liqiang.io/post/license-for-staruml