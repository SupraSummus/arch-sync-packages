set -euo pipefail
#set -x

INSTALLED_PACKAGES=$(yay -Qq --explicit | sort)
# strip comments
REQUIRED_PACKAGES=$(cat /etc/pkglist.txt | sed 's:#.*$::g' | tr ' ' '\n' | sort)
MISSING_PACKAGES=$(comm -13 <(echo "$INSTALLED_PACKAGES") <(echo "$REQUIRED_PACKAGES"))
UNWANTED_PACKAGES=$(comm -23 <(echo "$INSTALLED_PACKAGES") <(echo "$REQUIRED_PACKAGES"))

echo "### install missing and mark them as explicitly installed"
if [[ -n "$MISSING_PACKAGES" ]]; then
    yay -S --asexplicit -- $MISSING_PACKAGES
else
    echo "nothing to do"
fi

echo "### mark not mentioned as deps"
if [[ -n "$UNWANTED_PACKAGES" ]]; then
    yay -D --asdeps --quiet -- $UNWANTED_PACKAGES
else
    echo "nothing to do"
fi

echo "### removing not explicitly needed"
PACKAGES_TO_BE_REMOVED=$(yay -Qttdq)
if [[ -n "$PACKAGES_TO_BE_REMOVED" ]]; then
    yay -Rns -- $PACKAGES_TO_BE_REMOVED
else
    echo "nothing to do"
fi
