SetTimer Click, 50

F8::Toggle := !Toggle

Click:
    If (!Toggle)
        Return
    Send, e
   
return