#!/bin/bash

last_task_status () {
    if [ $? -eq 0 ]; then
        echo -e "${INFO}Status :: ${SUCCESS}OK \033[m"
    else
        echo -e "${INFO}Status :: ${ERROR}FAIL \033[m"
    fi
}
