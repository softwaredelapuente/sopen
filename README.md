# sopen
sopen stands for **simple open** and opens files based in ther mime types.

## Description
sopen is a comand for replaicing the xdg-open command for one simpler that also accepts the '\*' wildcard. Uses a file called sopen.list, but you can use your mimeapps.list file, for opening each file with the corret comand or files.desktop document. It will look for the file's mime type and in case there no one look for the most fitting one using the '\*' wildcard, see more down in example of a sopen.list.

## sopen example
```sh

    sopen some-file
    sopen -c other-sopen.list some-file
```
sopen will look in the sopen.list which program or file.desktop should use for opening the file based in it's mime type. with -c you could chage which file use for looking the mime types.

## sopen.list example
```

    text/*=$EDITOR
    text/markdown=nvim
    text/html=firefox.desktop
    application/pdf=zathura
    application/vnd.oasis.opendocument.text=libreoffice-writter.desktop
    application/vnd.oasis.opendocument.*=libreoffice
    image/*=feh
```
In this example of a sopen.list we described the use of firefox for html files, nvim for markdown ones ,in the rest of text/ cases the $EDITOR variable, zathura for pdf, libreoffice.desktop for opendocuments for text (odt for example), the libreoffice cmd for the rest of files that libreoffice suport (libreoffic-calc, libreoffic-draw, ...) and feh for al the images files (png, webp, jpg, etc).

It will always have priority the more precise mime-type with wildcard:
1. text/x-common-lisp=editor1
2. text/x-comm\*=editor2
3. text/\*=editor3

A text/comma-separated-values will use editor 2, a text/x-common-lisp will use editor1 and the rest of text/ will use editor3.

sopen.list is by default in ~/.config/sopen/sopen.list
It could be change in the FILE variable in sopen.sh

## ¿Why sopen?
The xgd-open command does not let you use the \* wildcard an the handlr program from my perspective is an overengineered piece of software. sopen is a extremely simple POSIX compliance shell script using POSIX compliance arguments for file, grep and sed.

## Licence
Copyright (c) Juan de la Puente Valbuena <softwaredelapuente@gmail.com>

Licensed under the EUPL-1.2 see more details in LICENSE
