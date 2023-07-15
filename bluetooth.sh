function get_powered {
    bluetoothctl show | grep -Po '(?<=Powered: )(yes|no)'
}

function get_connected {
    bluetoothctl devices Connected
}

if [ "$(get_powered)" = "no" ]; then
    echo ""
else
    if [ "$(get_connected)" = "" ]; then
        echo "󰂯"
    else
        echo "󰂱"
    fi
fi
