# java

Tutorial Java

## Interactive development

Untuk menulis post atau page secara interaktif, run

_To write a post or page interactively, run_

```
cd generator && gitbook serve
```

<br>

Website akan compile semula setiap kali kita ada perubahan pada file.

_The website will get re-compiled whenever there is a file change._

## Compile

Untuk compile tanpa run interactive environment, run

_To compile without running interactive environment, run_

```
cd generator && gitbook build
```

## Deployment

Pindahkan fail daripada `generator/_book` ke `docs` selepas compile.

_Move files from `generator/_book` into `docs`_ after compile.

```
rm -rf docs && mv generator/_book docs
```
