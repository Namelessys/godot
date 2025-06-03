#!/bin/bash

work_dir=$(pwd)
workspace=16

i3-msg "workspace $workspace; append_layout ${work_dir}/window_pos.i3workspace"
