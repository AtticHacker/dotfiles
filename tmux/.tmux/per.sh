#!/bin/env bash

ALL=`acpi`
a=($ALL)
nums="${a[3]}"
remaining="${a[4]}"
echo -n $nums | cut -c -3
