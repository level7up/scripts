# EMOTIES  https://gist.github.com/BuonOmo/77b75349c517defb01ef1097e72227af

# COLORS  
Black='\e[30m'
Dark_Gray='\e[30m'
Red='\e[31m'
Light_Red='\e[31m'
Green='\e[32m'
Light_Green='\e[32m'
Brown_Orange='\e[33m'
Yellow='\e[33m'
BLUE='\e[34m'
Light_Blue='\e[34m'
Purple='\e[35m'
Light_Purple='\e[35m'
Cyan='\e[36m'
Light_Cyan='\e[36m'
Light_Gray='\e[37m'
WHITE='\e[37m'
RED='\e[31m'
NC='\e[0m' # No Color
echo "${RED}📌📌📌📌📌📌📌📌📌📌📌📌📌📌📌📌📌${NC}";
echo "${Light_Cyan}PUSH FROM THIS PC ${NC}"
cd /var/www/claimizer && git add .  && git commit -m ":zap: form local" && git push origin master

echo "----------------------------------";

echo "TODO :: PUSH FROM SERVER"
ssh -t  falcon << EOF
    cd /var/www/claimizer-beta
    git add . && git commit -m ":zap: form server"
    git push origin master
    git pull origin master
    exit
EOF

echo "----------------------------------";

echo "TODO :: PULL FROM THE SERVER"
git pull origin master
echo "----------------------------------";
echo "TODO :: MIGRATE AND SEED"

echo "----------------------------------";

echo "TODO :: RESTART SUPERVISOR"
