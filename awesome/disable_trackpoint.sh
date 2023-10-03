#!/bin/bash
disable_trackpoint(){
    id=$(xinput list|grep "Elan TrackPoint.*id=[[:digit:]]\+" | sed -e 's/^.*=\([[:digit:]]\+\).*$/\1/g')
    [ -n $id ] && xinput set-prop $id 'Coordinate Transformation Matrix' 0 0 0 0 0 0 0 0 1
}

enable_trackpoint(){
    id=$(xinput list|grep "Elan TrackPoint.*id=[[:digit:]]\+" | sed -e 's/^.*=\([[:digit:]]\+\).*$/\1/g')
    [ -n $id ] && xinput set-prop $id 'Coordinate Transformation Matrix' 1 0 0 0 1 0 0 0 1
}
