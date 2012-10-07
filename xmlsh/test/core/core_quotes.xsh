# Tests of basic quote parsing


# function to help test positional params and expansions
function args () 
{
	echo '$#' $#
	for a ; do
	   echo $a
	done
}


# basic single and double quotes
echo foo bar
echo 'foo'
echo "foo bar"
echo 'foo bar'

echo foo"bar"
echo foo'bar'

echo "foo"bar
echo 'foo'bar

echo foo"bar"spam
set foo" bar "spam
echo $#
echo $*
set foo' bar 'spam
echo $#
echo $*


echo foo"bar'spam'bletch"barf


# variable expansion within quotes
_A=test

echo "$_A"
echo foo"$_A"
echo foo"$_A"bar
echo "$_A"foo


# verify expansion does NOT take place in single quotes
echo '$_A'
echo foo'$_A'
echo foo'$_A'bar

# Tests of backslashes

echo foo\bar
echo foo\\bar
echo foo\\\bar
echo 'foo\bar'
echo 'foo\\bar'
echo 'foo\\\bar'
echo "foo\bar"
echo "foo\\bar"
echo "foo\\\bar"

# Multiline quoting

echo "on a single \
line"

echo 'on a single \
line'

echo "line 1
line 2"

echo 'line 1
line 2'



# Test that we strip quotes off of variable assigments
_A="test"
echo <[ <foo attr="{$_A}"/> ]>

# Quoting inside variables and $*
_A='""'
echo $_A $_A
set $_A $_A
echo $#
echo $*
echo "$*"

# Initial \ or quoted "
echo \"
echo \'\"
echo \''foo bar'\'

# Test $@ "$@" $* "$@" 
set "foo" '""' "bar spam"
args $*
args "$*"
args "$* bletch"
args $@
args "$@"
args "$@bletch"


# Test preserving quotes in XML expressoins
a=<[ <foo bar="spam" bletch='abc'>"Text Here in Quotes"</foo> ]>
echo $a
xecho $a
echo "$a"
echo "foo${a}bar"


