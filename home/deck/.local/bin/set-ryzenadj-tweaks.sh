#!/bin/sh
set -eu

allow=$(</home/deck/.local/bin/allowadj.txt)

# https://github.com/NGnius/PowerTools/issues/84#issuecomment-1482736698
# https://www.amd.com/system/files/documents/faq-curve-optimizer.pdf
# Expect your UV to be 3-5x your set curve value. IE: -5 = -15mv to -25mv

# CPU
if [[ $allow = "1" ]]
then 
    # 0x100000 - 5 (Range: -30, 30)
    /home/deck/.local/bin/ryzenadj --set-coall=0xFFFFB
    echo "Undervolt on" > /home/deck/.local/bin/statusadj.txt
else
    # 0x100000 - 0
    /home/deck/.local/bin/ryzenadj --set-coall=0x100000
    echo "Undervolt off" > /home/deck/.local/bin/statusadj.txt
fi

# GPU - Not functional
# 0x100000 - 5 (Range: -30, 30)
#/home/deck/.local/bin/ryzenadj --set-cogfx=0xFFFFB
