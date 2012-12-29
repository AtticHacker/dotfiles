#!/bin/env bash

ALL=`acpi`
a=($ALL)
echo -n ${a[3]} | cut -c -3


