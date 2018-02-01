#!/bin/bash
source ./host


ssh $USER@$HOST_LIST 'bash -s' < ./script.sh

