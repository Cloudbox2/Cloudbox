#!/usr/bin/with-contenv bash

echo '---------------------------'
echo '| Jackett theme.park Mod  |'
echo '---------------------------'

# Display variables for troubleshooting
echo -e "Variables set:\\n\
'TP_DOMAIN'=${TP_DOMAIN}\\n\
'TP_THEME'=${TP_THEME}\\n"

# Set default
if [[ -z ${TP_DOMAIN} ]]; then
    echo 'No domain set, defaulting to gilbn.github.io'
    TP_DOMAIN='gilbn.github.io'
fi

if [[ -z ${TP_THEME} ]]; then
    echo 'No theme set, defaulting to organizr-dark'
    TP_THEME='organizr-dark'
fi

# Adding stylesheets
if ! grep -q "${TP_DOMAIN}" /app/Content/index.html; then
    echo '---------------------------'
    echo '|  Adding the stylesheet  |'
    echo '---------------------------'
    sed -i "s/<\/head>/<link rel='stylesheet' href='https:\/\/${TP_DOMAIN}\/theme.park\/CSS\/themes\/jackett\/${TP_THEME}.css'><\/head> /g" /app/Content/index.html
    printf 'Stylesheet set to %s\n' "${TP_THEME}
    "
fi
