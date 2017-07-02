# java

Tutorial Java

### Interactive development

Untuk menulis post atau page secara interaktif, run

_To write a post or page interactively, run_

```
lein ring server
```

<br>

Website akan compile semula setiap kali kita ada perubahan pada file.

_The website will get re-compiled whenever there is a file change._

### Compile

Untuk compile tanpa run interactive environment, run

_To compile without running interactive environment, run_

```
lein run
```

### Update page index

Page tutorial dalam Jom Belajar Java menggunakan metadata `:page-index`
untuk menentukan kedudukan. Untuk update metadata tersebut, update
kedudukan page tersebut dalam `page-index.txt`, kemudian run script
`update-page-index.lisp`.

_The tutorial pages in Jom Belajar Java uses `:page-index` metadata to
determine their position. To update the metadata, update the position
in `page-index.txt` file, and then run `update-page-index.lisp` script._

<br>

Untuk run script tersebut, install SBCL.

_To run the script, install SBCL._

```
sudo apt-get install sbcl
```

<br>

Run script tersebut,

_Run the script,_

```
./update-page-index.lisp
```

### License

[Open Publication License](https://www.opencontent.org/openpub/)
