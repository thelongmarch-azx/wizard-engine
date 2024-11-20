#!/bin/bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
PROJ_BASE="$DIR/../../../../.."

. $PROJ_BASE/test/common.sh whamm

make_binary wizeng || exit $?
WIZENG="$PROJ_BASE/$BINARY $WIZENG_OPTS -colors=false"

target=$TEST_TARGET

print_testing

cd $DIR

if [ "$#" = 0 ]; then
    # Generate fresh .wasm from .wat files
    wat2wasm_dir "./"

    TESTS=$(ls *.wasm)
else
    TESTS="$@"
fi

RAW=${RAW:=0}

function run_test() {
    local test=$1
    local flags=""
    local args=""

    echo "##+$test"

    if [ -f $test.linked ]; then
	linked=$(cat $test.linked)
    fi
    if [ -f $test.app ]; then
	app=$(cat $test.app)
    fi
    if [ -f $test.flags ]; then
	flags=$(cat $test.flags)
    fi

    local P=$T/$test

    if [ -f $test.in ]; then
	$WIZENG $flags --monitors=$test $linked $app < $test.in > $P.out 2> $P.err
    else
	$WIZENG $flags --monitors=$test $linked $app > $P.out 2> $P.err
    fi
    echo $? > $P.exit

    for check in "out" "err" "exit"; do
	if [ -f $test.$check ]; then
	    diff $test.$check $P.$check | tee $P.$check.diff
	    DIFF=${PIPESTATUS[0]}
	    if [ "$DIFF" != 0 ]; then
		if [ -f failures.$target ]; then
		    grep $test failures.$target
		    if [ $? = 0 ]; then
			continue # test was found in expected failures
		    fi
		fi
		if [ -f failures.$target.$TEST_MODE ]; then
		    grep $test failures.$target.$TEST_MODE
		    if [ $? = 0 ]; then
			continue # test was found in expected failures
		    fi
		fi
		if [ -f failures.all ]; then
		    grep $test failures.all
		    if [ $? = 0 ]; then
			continue # test was found in expected failures
		    fi
		fi
		echo "##-fail: $P.$check.diff"
		return 1
	    fi
	fi
    done

    echo "##-ok"
}

function run_tests() {
    printf "##>%d\n" $#
    for t in $@; do
	run_test $t
    done
}

if [ "$RAW" = 0 ]; then
    run_tests $TESTS | $PROGRESS
else
    run_tests $TESTS
fi
