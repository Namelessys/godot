#!/bin/bash

work_dir=$(pwd)
workspace=1

i3-msg "workspace $workspace; append_layout ${work_dir}/window_pos.i3workspace"
