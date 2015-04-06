syntax include @C syntax/c.vim
syntax region cCode  start=+#>+ keepend end=+<#+  contains=@C
syntax keyword Type Task Func Reset Isr Idle
syntax keyword Number [0-9]+ 0x[0-9A-Fa-f]+ 0b[0-1]+
syntax keyword Statement async sync pend claim

