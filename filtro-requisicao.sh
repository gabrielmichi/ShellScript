#!/bin/bash

cd ~/apache-log

if [ $1 == "GET" ]
then
    cat apache.log | grep GET

