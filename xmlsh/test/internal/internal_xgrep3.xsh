# 
# Test of xgrep command

# XML output
# Test assignment to variable to verify that VariableOutputPort works with scripting stax events

xgrep //ITEM ../../samples/data/*.xml >{_out}
xecho $_out

