
function should_display_cf_api_status() {
    setopt +o nomatch
    files=(./manifest*.yml)
    setopt -o nomatch
    #echo all ${files}
    #echo one ${files[1]}
    [[ -f ./manifest.yml || -f ./.show-cf-api-status || -f "${files[1]}" ]]
}

function printNameFromSection() {
    echo -n $(echo $2 | grep -A3 $1 | grep Name | cut -d":" -f2 | tr -d "\", ")
}

function set_cf_api_status() {
    if (! should_display_cf_api_status) ; then
        return
    fi
    echo " "
    echo -n "├─ "
    # Figure out if CF_HOME is set, set the location of the config.json file.
    # ___cf_home=$(echo ${CF_HOME} | cut -d "/" -f4)
    ___cf_home=$(echo ${CF_HOME} | cut -c15-)
    if [[ -n "$___cf_home" ]] ; then
        echo -n " $___cf_home"
        ___cf_config_info=$(<${CF_HOME}/.cf/config.json)
    else
        echo -n " .cf"
        ___cf_config_info=$(<~/.cf/config.json)
    fi
    # Figure out if the user is logged in.
    ___loggedIn=
    if [[ -n ${___cf_config_info} ]] ; then
        ___loggedIn=$(echo ${___cf_config_info} | grep AccessToken | grep -v "\"\"")
    fi
    if [[ -z "$___loggedIn" ]] ; then
        echo -n " | not logged in"
        return
    fi
    #Print stuff
    # api endpoint / nickname
    echo -n " | "$(echo ${___cf_config_info} | grep Target | cut -d"." -f2-3 | sed "s/\.garmin//g")
    # Org
    echo -n " / "
    printNameFromSection OrganizationFields ${___cf_config_info}
    # Space
    echo -n " / "
    printNameFromSection SpaceFields ${___cf_config_info}
}
