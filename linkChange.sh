#This tool just mask your phishing link into a genuine looking link and this tool is created by Madhurendra Singh (Senti Sehzzada)

url_checker() {
    if [ ! "${1//:*}" = http ]; then
        if [ ! "${1//:*}" = https ]; then
            echo -e "\e[31m[!] Invalid URL. Please use http or https.\e[0m"
            exit 1
        fi
    fi
}

echo -e "\n\e[1;31;42m######This Tool is prepared by Madhurendra Singh (SENTI SEHZZADA) ##### \e[0m"
echo -e "\e[1;31;42m ### Phishing URL ###\e[0m \n"
echo -n "Paste The Actual link here (with http or https): "
read phish
url_checker $phish
sleep 1
echo "Creating a Phishing link"
echo ""
short=$(curl -s https://is.gd/create.php\?format\=simple\&url\=${phish})
shorter=${short#https://}
echo -e "\n\e[1;31;42m ### Making Another Domain ###\e[0m"
echo 'Your Desired Domain Name (with http or https), ex: https://google.com, http
://anything.org) :'
echo -en "\e[32m=>\e[0m "
read mask
url_checker $mask
echo -e '\nType social engineering words:(like free-money, best-pubg-tricks)'
echo -e "\e[31mUse (-) this instead of space in between social engineering words\e[0m"
echo -en "\e[32m=>\e[0m "
read words
echo -e "\nGenerating Your Desired Link...\n"
final=$mask-$words@$shorter
echo -e "Here is the MaskPhish URL:\e[32m ${final} \e[0m\n"
