#!/bin/bash


SIM=iverilog
#SIM=cvc64

if [ $SIM = iverilog ]; then
    MACRO=-D
    PARAM=-P
    EXTRA=
    EXTRA2=-lxt
else
    MACRO=+define+
    PARAM=+param+
    EXTRA="+dump2fst +fst+parallel2=on"
    EXTRA2=
fi
SDRAM_SHIFT=0
DUMP=${MACRO}DUMP

while [ $# -gt 0 ]; do
    case $1 in
        -dump) DUMP=${MACRO}DUMP;;
        -nodump) DUMP=;;
        -mister) EXTRA="$EXTRA ${MACRO}MISTER ${MACRO}JTFRAME_SDRAM_ADQM";;
        -mist) ;;
        -time)
            shift
            EXTRA="$EXTRA ${MACRO}SIM_TIME=${1}_000_000";;
        -period)
            shift
            EXTRA="$EXTRA ${MACRO}PERIOD=$1";;
        -readonly)
            EXTRA="$EXTRA ${MACRO}WRITE_ENABLE=0";;
        -norefresh)
            EXTRA="$EXTRA ${MACRO}NOREFRESH";;
        -len)
            shift
            if [[ ! $1 =~ [0123] ]]; then
                echo expecting bank number "(0-3)" after -len
                exit 1
            fi
            if [[ $2 != 16 && $2 != 32 && $2 != 64 ]]; then
                echo "bank length must be 16, 32 or 64"
                exit 1
            fi
            EXTRA="$EXTRA ${PARAM}test.BA${1}_LEN=$2"
            shift;;
        -bwait)
            shift
            EXTRA="$EXTRA ${MACRO}JTFRAME_SDRAM_BWAIT=$1";;
        -shift)
            shift
            SDRAM_SHIFT=$1
            if [ "$1" != 0 ]; then
                EXTRA="$EXTRA ${PARAM}test.SHIFTED=1"
            fi;;
        -perf)
            EXTRA="$EXTRA ${MACRO}WRITE_ENABLE=0 ${PARAM}test.IDLE=0 ${MACRO}NOREFRESH";;
        -h|-help) cat << EOF
    Tests that correct values are written and read. It also tests that there are no stall conditions.
    All is done in a random test.
Usage:
    -dump         enables waveform dumping (default)
    -nodump       disables waveform dumping
    -time val     simulation time in ms (5ms by default)
    -period       defines clock period (default 10ns = 100MHz)
                  10.416 for 96MHz
                  7.5ns sets the maximum speed before breaking SDRAM timings
    -shift        delay for SDRAM clock in ns
    -readonly     disables write requests
    -repack       repacks output data, adding one stage of latching (defines JTFRAME_SDRAM_REPACK)
    -norefresh    disables refresh
    -write        chance of a write in the writing bank. Integer between 0 and 100
    -idle         defines % of time idle for each bank requester. Use an integer between 0 and 100.
    -perf         Measures read performance: disables writes and refresh. Sets idle time to 0%.
    -maxa         Max bit assigned in the address bus. Default is 21, for full A bus access

    Bank options:
    -1banks       Only bank 0 is active
    -2banks       Only banks 0 and 1 are active
    -3banks       Only banks 0, 1 and 2 are active
    -bwait        Clock cycles to wait in between new requests

    -mister       enables MiSTer simulation, with special constraint on DQM signals
    -mist         enables free use of DQM signals (default)
EOF
        exit 1;;
    *)  echo "Unexpected argument $1"
        exit 1;;
    esac
    shift
done

echo Extra arguments: "$EXTRA"
HDL=$JTFRAME/hdl
$SIM test.v $HDL/sdram/jtframe_{sdram64*,dwnld}.v $HDL/ver/mt48lc16m16a2.v \
    -o sim ${MACRO}JTFRAME_SDRAM_test.BANKS ${MACRO}SIMULATION $DUMP $EXTRA \
    ${MACRO}SDRAM_SHIFT=$SDRAM_SHIFT \
&& sim $EXTRA2
rm -f sim
