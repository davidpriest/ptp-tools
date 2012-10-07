# Test ports
unset doc doc2 doc3 xdoc
# Input XML ports
xread xdoc < ../../samples/data/books.xml
echo There are $(xpath 'count(//ITEM)' <{xdoc}) ITEMS

# Text Input , Text output, external comma 
doc=$(<../../samples/data/books.csv)
cat <{doc} >{doc2}

# Text input xml output
csv2xml <{doc2} >{doc3}

xquery '/root/row[2]/col[3]/string()' <{doc3}

xquery -i $doc3 '/root/row[2]/col[3]/string()'

unset doc doc2 doc3 xdoc

# Test sequences stored into variables
xpath -n "1,2,'foo',3" >{_seq}
echo <[ $_seq[3] ]>

xquery -n "<foo/>,<bar><spam>bletch</spam></bar>,3" >{_seq}
echo There are <[count($_seq)]> elements
echo <[ $_seq[2]//spam ]>

# Test appending xml values to ports 
unset _seq
xpath -n 1 >{_seq}
xquery -n "<foo/>,<bar><spam>bletch</spam></bar>" >>{_seq}
xpath -n 2 >>{_seq}
echo There are <[count($_seq)]> elements
echo <[ $_seq[3]//spam ]>


# write and append to text 
unset _seq
echo -n foo >{_var}
echo -n bar >>{_var}
echo $_var should be foobar

# Test mixed string and xml 
xecho <[ <foo/> ]> >> {_var}
xecho $_var

# Test brace group into ports
unset _var
{ xecho <[ <foo>brace group</foo> ]>; xecho <[ <bar/> ]>;  } >{_var}
xecho $_var
unset _var
( xecho <[ <foo>sub shell</foo> ]>; xecho <[ <bar/> ]>;  ) >{_var}
xecho $_var
unset _var


# Test named ports (output)

echo -p output output 
echo output2 >(output)
for i in output3 ; do 
   echo $i 
done >(output)

echo output4 |  while read a ; do echo $a ; done >(output)
if true ; then echo output5 ; fi >(output)

while true ; do 
  echo output6
  break ;
done >(output)

{ echo output7 ;} >(output)
( echo output8 ) >(output)

# Test named ports input

echo input1 | read a <(input)
echo $a

echo input2 | while read a ; do echo $a ; done <(input)

echo input3 | if true ; then read a ;  echo $a ; fi <(input)
echo input4 | for a in a ; do read b ; echo $b ; done <(input)






