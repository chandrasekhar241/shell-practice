#!bin/bash

## if condition

#gt - greater than
#lt - less than
#ge - greater than or equalto
#eq - equal to
#ne - not equal
#le - less than or equal

NUMBER=$1

if [ $NUMBER -ge 20 ]; then
    echo "Given number is $NUMBER greater that or equal to 20"
else
    echo "Given number is less than 20"
fi