# Deployment (NetBeans)

Sebelum ini kita membuat _deployment_ dengan menggunakan _Ant build
system_. Ada sesetengah _steps_ yang mungkin terlebih rumit untuk
sesetengah orang. Jika anda menggunakan Netbeans, ada beberapa
_shortcut_ yang kita boleh gunakan.

## Icon

Cara yang sama digunakan seperti sebelum ini.

## Executable JAR

Cara yang sama digunakan seperti sebelum ini.

## Executable EXE

Untuk membuat file EXE menggunakan Netbeans, klik kanan pada `project`,
kemudian `Properties`. Pergi ke `Deployment`, dan _tick_ `Enable Native
Packaging`. Klik `OK`.

Setelah selesai, sekali lagi klik kanan pada `project`, dan kita boleh
nampak menu baru iaitu `Package as`. Untuk membuat file EXE, pergi ke
`Package as`, dan klik `Image Only`.

![Gambar membuat file EXE menggunakan Netbeans](img/package_as.png)

File EXE tersebut akan berada di folder `dist/bundle`.

## Tukar icon file EXE

Tukar format icon kepada `.ico` seperti sebelum ini. Kemudian klik kanan
pada `project`, dan klik `Properties`. Pergi ke `Deployment`.

Di sini kita boleh nampak `Icons and Splash Image:`. Klik `Edit...`, dan
pilih gambar `.ico` untuk `Native Package Icon`.

![Gambar menambah icon pada file EXE menggunakan Netbeans](img/icon_pada_exe.png)

Setelah selesai, hasilkan kembali file EXE seperti sebelum ini untuk
lihat icon baru pada file EXE tersebut.

## Executable EXE tanpa JRE

Sebab-sebab kenapa kita buat step ini telah diberitahu di post sebelum
ini.

Untuk membuang JRE daripada _deployment_, buka file config yang berada
di folder `app` menggunakan Notepad/Notepad++. File tersebut akan
kelihatan seperti ini:

```
app.runtime=$APPDIR\runtime
app.mainjar=HelloJavaFX.jar
app.version=1.0
app.id=hellojavafx
app.preferences.id=hellojavafx
app.mainclass=hellojavafx/HelloJavaFX
app.classpath=
```

Padam _path_ ‘runtime’ tersebut seperti ini:

```
app.runtime=
app.mainjar=HelloJavaFX.jar
app.version=1.0
app.id=hellojavafx
app.preferences.id=hellojavafx
app.mainclass=hellojavafx/HelloJavaFX
app.classpath=
```

Setelah selesai, kita boleh _delete_ folder `runtime` daripada folder
_deployment_ kita.

## Installer

Cara yang sama digunakan seperti sebelum ini.