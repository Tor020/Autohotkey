https://amourspirit.github.io/AutoHotkey-Snippit/WindowSpy.htm

- Window Spy is a utility program that is installed with AutoHotkey. Window Spy allows you to see various information about a window that can be use with AutoHotkey and AutoHotkey Snippit.


Write To File Links
(Why you shouldn't use FileAppend to continuously write to the disk)[https://www.autohotkey.com/boards/viewtopic.php?t=61853]


(Taken From)[https://www.autohotkey.com/board/topic/52476-how-to-write-into-a-text-file/]
```
From what I understood this is the way to go :

1. Read the contents of the file into a variable using FileRead.

2. Modify the variable's contents (possibly using StringMid, or other String-type commands)

3. Delete the file using FileDelete.

4. Append the variable's contents into the same file using FileAppend.

Alternate way :
1. Read the contents of the file into a variable using FileRead.

2. Modify the variable's contents (possibly using StringMid, or other String-type commands)

3. Append the variable's contents into a new file using FileAppend.

4. Overwrite the old file with the new one by using FileMove, <newfile>, <oldfile>, %True%. (parameter 3 is the 'overwrite' parameter)
```


# A "Swiss Army Knife" library for Text (files)
https://github.com/hi5/TF

- As the name suggest this is an AutoHotkey (AHK) Library with a number of functions to "manipulate" text, both files such as *.txt, *.ahk, *.html, *.css etc AND Strings (or variables). For example you can delete specific lines, replace words or specific lines, number lines, remove or insert columns of text, etc. See the list of functions below for a complete overview.