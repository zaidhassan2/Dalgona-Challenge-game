#!/bin/bash
BLACK="\e[30m"
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
WHITE="\e[37m"
RESET="\e[0m"
# coloring
BOLD="\e[1m"
UNDERLINE="\e[4m"

BG_BLACK="\e[40m"
BG_RED="\e[41m"
BG_GREEN="\e[42m"
BG_YELLOW="\e[43m"
BG_BLUE="\e[44m"
BG_MAGENTA="\e[45m"
BG_CYAN="\e[46m"
BG_WHITE="\e[47m"



# Startiing Code
start_code() #This function show the diagram of the initial code for a good look in this it has a sleep of 2 s at start while next it reduces to 0 s i uses a tool figlet whith font slant which displlay the words in a big and good font
{
count=$1
n=0
if [[ $count == 0 ]];
then
n=2
fi
text3="==============================================================================================="
text1="Dalgona"
text2="Challenge"

ascii_art1=$(figlet -f slant "$text1")
ascii_art2=$(figlet -f slant "$text2")
echo -e "${BOLD}${RED}$text3${RESET}"
combined_art=$(paste <(echo "$ascii_art1") <(echo "$ascii_art2"))
sleep $n
echo -e "${BOLD}${YELLOW}$(echo "$combined_art" | sed 's/\t/  /g')${RESET}\n"
sleep $n
echo -e "${GREEN}_${BG_BLUE}${YELLOW}${BOLD}Author1: Zaid ${RESET}${GREEN}_____________________${BG_RED}${YELLOW}${BOLD}Author2: Rizwan ${RESET}${GREEN}_____________________${BG_WHITE}${RED}${BOLD}Mam: Miss Naba Rahim ${RESET}"
echo -e "${YELLOW}'--------------'                   '----------------'                   '---------------------'"
echo -e "${BOLD}${RED}$text3${RESET}"
}



#Random Diagram
Random_Diagram() #This code has an array and from array it generate 1 index randomly and after that the shape is returned
{
shapes=("circle" "triangle" "star" "umbrella")
random=$(( RANDOM % ${#shapes[@]} ))
selected=${shapes[$random]}
echo "$selected"
}



#Display Diagram
Display_Diagram() #This function takes the parameter that returned by the Random_Diagram function and draw shape accordingly
{
case "$1" in
"circle")
   echo -e "${CYAN}  *****  "
            echo -e "${CYAN} *     * "
            echo -e "${CYAN}*       *"
            echo -e "${CYAN} *     * "
            echo -e "${CYAN}  *****  "
;;
"triangle")
 echo -e "${GREEN}    *    "
            echo -e "${GREEN}   ***   "
            echo -e "${GREEN}  *****  "
            echo -e "${GREEN} ******* "
            echo -e "${GREEN}*********"
;;
"star")
 echo -e "${YELLOW}    *    "
            echo -e "${YELLOW}   ***   "
            echo -e "${YELLOW}  *****  "
            echo -e "${YELLOW}   ***   "
            echo -e "${YELLOW}    *    "
;;
"umbrella")
echo -e "${BLUE}  *****  "
            echo -e "${BLUE} ******* "
            echo -e "${BLUE}  ***** "
            echo -e "${BLUE}    *   "
            echo -e "${BLUE}    *   "
            echo -e "${BLUE}    *   "
;;
*)
echo -e "${RED}INVALID SHAPE${RESET}"
;;
esac


}





#Computer Mode
computer_mode() #This function will be called when user wanted to play with computer and in this function first try is that o user and second is computer in the user mode user is asked to guess the shape while computer guess the shape randomly if answer is wrong then 1 chance will be removed and at the last the result is displayed
{
i=0
count1=3
count=3
score1=0
score2=0
echo -e "                                          ${BG_CYAN}${RED}${BOLD}==========================${RESET}"
echo -e "                                         ${BG_CYAN}${YELLOW}${BOLD}||     Computer MODE      ||${RESET}"
echo -e "                                          ${BG_CYAN}${RED}${BOLD}==========================${RESET}"
for (( i = 0 ; count > 0 && count1 > 0 ; i++ ));
do

Shape=$(Random_Diagram)
Display_Diagram "$Shape"
echo -e "${BG_BLUE}${RED}${BOLD}$user's turn${RESET}"
echo -e "${GREEN}${BOLD}Dear ${YELLOW}$user!${GREEN} guess the name of shape in ${RED}$Difficulty${GREEN} Seconds${RESET}${YELLOW}"
if read -t $Difficulty sh;
then
  if [[ $sh == $Shape ]];
 then
 score1=$((score1+10))
 echo -e "${RESET}${GREEN}${BOLD}Right Answer ${RESET}"
  else
  count=$((count-1))
   echo -e "${RESET}${RED}${BOLD}Wrong Answer!${RESET}"
 echo -e "${GREEN}${BOLD}Right answer is $Shape${RESET}\n"
  echo -e "\n${BG_RED}${GREEN}${BOLD}Dear $user! Your Remaining  Attempts are $count${RESET}\n"

 fi
 else
  count=$((count-1))
 echo -e "${RED}${BOLD}Sorry Timeout${RESET}\n"
  echo -e "\n${RESET}${BG_RED}${GREEN}${BOLD}Dear $user! Your Remaining  Attempts are $count${RESET}\n"

 fi

 #Computer

 Shape=$(Random_Diagram)
Display_Diagram "$Shape"
echo -e "${BG_BLUE}${RED}${BOLD}Computer's turn${RESET}"
echo -e "${YELLOW}${BOLD}Computer will guess the name of shape in ${RED}$Difficulty${YELLOW}${BOLD} Seconds${RESET}\n"
echo -e "                       ${BG_WHITE}${RED}${BOLD} Waiting...${RESET}\n"
sleep 1
shapes=("circle" "triangle" "star" "umbrella")
random=$(( RANDOM % ${#shapes[@]} ))
sh=${shapes[random]}
echo -e "${YELLOW}${BOLD}Computer is guessing the shape in ${RED}$Difficulty${YELLOW}${BOLD} Seconds${RESET}\n"
sleep $((Difficulty-1))
echo -e "${YELLOW}$sh${RESET}\n"
  if [[ $sh == $Shape ]];
 then
 score2=$((score2+10))
 echo -e "${GREEN}${BOLD}Right Answer ${RESET}"
  else
   count1=$((count1-1))
   echo -e "${RED}${BOLD}Wrong Answer!${RESET}"
 echo -e "${GREEN}${BOLD}Right answer is $Shape${RESET}"
  echo -e "\n${BG_RED}${GREEN}${BOLD}Computer's  Remaining  Attempts are $((count1))${RESET}\n"

fi
done
 if [[ $score1 -gt $score2 ]];
 then
 echo -e "${BLUE}${BOLD}${UNDERLINE}Congratulations! $user You Won the Game\n${RESET}"
 elif [[ $score1 -gt $score2 ]]; then
 echo -e "${BLUE}${BOLD}${UNDERLINE}Sorry! $user You lost the game\n${RESET}"
 else
 echo -e "${BG_WHITE}${BLUE}${BOLD}${UNDERLINE}Match Draw/n${RESET}"
 fi
 if [[ $score1 -gt $computer_score ]];
 then
 computer_score=$score1
fi

}




#Single Mode

single_mode() #In this function user can play seperately shape is shown and the timer is set according to difficulty level and user have to guess the shape in the specific time if answer is wrong then chances will be decrese
{
i=0
win=0
count=3
score=0
echo -e "                                          ${BG_CYAN}${RED}${BOLD}==========================${RESET}"
echo -e "                                          ${BG_CYAN}${YELLOW}${BOLD}||     SINGLE MODE      ||${RESET}"
echo -e "                                          ${BG_CYAN}${RED}${BOLD}==========================${RESET}"
for ((i=0 ; count > 0  ; i++));
do

Shape=$(Random_Diagram)
Display_Diagram "$Shape"
echo "Dear $user! guess the name of shape in $Difficulty Seconds"
if read -t $Difficulty sh;
then
  if [[ $sh == $Shape ]];
 then
 score=$((score+10))
win=$((win+1))
 echo "Dear $user! Your answer is right "
  else
  count=$((count-1))
 echo "Wrong Answer!  $user!"
 echo "Right answer is $Shape"

echo -e "\n${BG_RED}${GREEN}${BOLD}Dear $user! Your Remaining  Attempts are $((count))${RESET}\n"
 fi
else
count=$((count-1))
echo -e "${BG_WHITE}${RED}Dear $user! Sorry! Timeout${RESET}"
echo -e "\n${BG_RED}${GREEN}${BOLD}Dear $user! Your Remaining  Attempts are $((count))${RESET}\n"
fi
done
if [ $score -gt $single_score ];
then
single_score=$score
fi

echo -e "${BG_BLUE}${YELLOW}${BOLD}Total attemps= $i${RESET}"
echo -e "${BG_WHITE}${RED}${BOLD}Win games= $win${RESET}"

}

#Multiplayer
Multiplayer() #In this function 2 users can play game at a time first a user will guess and after that the other will guess in this way the wrong answer will decrese the number of attempts at the last the winner will be displayed on the screen
{
i=0
count1=3
count=3
score1=0
score2=0
echo -e "                                          ${BG_CYAN}${RED}${BOLD}==========================${RESET}"
echo -e "                                         ${BG_CYAN}${YELLOW}${BOLD}||     MULTIPLAYER MODE      ||${RESET}"
echo -e "                                          ${BG_CYAN}${RED}${BOLD}==========================${RESET}"
for (( i = 0 ; count > 0 && count1 > 0 ; i++ ));
do

Shape=$(Random_Diagram)
Display_Diagram "$Shape"
echo -e "${BG_BLUE}${RED}${BOLD}$user's turn${RESET}"
echo -e "${GREEN}${BOLD}Dear ${YELLOW}$user!${GREEN} guess the name of shape in ${RED}$Difficulty${GREEN} Seconds${RESET}${YELLOW}"
if read -t $Difficulty sh;
then
  if [[ $sh == $Shape ]];
 then
 score1=$((score1+10))
 echo -e "${RESET}${GREEN}${BOLD}Right Answer ${RESET}"
  else
  count=$((count-1))
   echo -e "${RESET}${RED}${BOLD}Wrong Answer!${RESET}"
 echo -e "${GREEN}${BOLD}Right answer is $Shape${RESET}\n"
  echo -e "\n${BG_RED}${GREEN}${BOLD}Dear $user! Your Remaining  Attempts are $count${RESET}\n"

 fi
 else
  count=$((count-1))
 echo -e "${RED}${BOLD}Sorry Timeout${RESET}\n"
  echo -e "\n${RESET}${BG_RED}${GREEN}${BOLD}Dear $user! Your Remaining  Attempts are $count${RESET}\n"

 fi

 #Other Player

 Shape=$(Random_Diagram)
Display_Diagram "$Shape"
echo -e "${BG_BLUE}${RED}${BOLD}$user1's turn${RESET}"
echo -e "${YELLOW}${BOLD}Dear ${RED}$user1!${GREEN} guess the name of shape in ${RED}$Difficulty${GREEN} Seconds${RESET}${YELLOW}"
if read -t $Difficulty sh;
then
  if [[ $sh == $Shape ]];
 then
 score2=$((score2+10))
 echo -e "${GREEN}${BOLD}Right Answer ${RESET}"
  else
   count1=$((count1-1))
   echo -e "${RED}${BOLD}Wrong Answer!${RESET}"
 echo -e "${GREEN}${BOLD}Right answer is $Shape${RESET}"
  echo -e "\n${BG_RED}${GREEN}${BOLD}$user1's  Remaining  Attempts are $((count1))${RESET}\n"
  fi

  else
   count1=$((count1-1))
 echo -e "${RED}${BOLD}Sorry Timeout${RESET}\n"
  echo -e "\n${RESET}${BG_RED}${GREEN}${BOLD}Dear $user1! Your Remaining  Attempts are $count1${RESET}\n"

fi
done
us=0
 if [[ $score1 -gt $score2 ]];
 then
 us=$user
 echo -e "${BLUE}${BOLD}${UNDERLINE}Congratulations! $user You Won the Game\n${RESET}"
 elif [[ $score1 -lt $score2 ]]; then
 us=$user1
 echo -e "${BLUE}${BOLD}${UNDERLINE}Congratulations! $user1 You Won the Game\n${RESET}"
 else
 echo -e "${BG_WHITE}${BLUE}${BOLD}${UNDERLINE}Match Draw/n${RESET}"
 fi
 if [[ $us -gt $Multi_player ]];
 then
 Multi_player=$us
fi
}


#Initial Starting
#code execution will start from here here we can say as the main of the code here are cases from where user can change its difficulty level can see score and play games
user="user"
USER1="USER"
Multi_player=0
single_score=0
computer_score=0
Difficulty=8
ch='y'
cn=0;
clear
while [[ $ch != 'E'   &&   $ch != 'e' ]];
do
start_code $cn
echo -e "${BG_BLACK}${BOLD}${CYAN}1. Start Game${RESET}"
echo -e "${BG_BLACK}${BOLD}${CYAN}2. Difficulty Levels${RESET}"
echo -e "${BG_BLACK}${BOLD}${CYAN}3. Leaderboard${RESET}"
echo -e "${BG_BLACK}${BOLD}${CYAN}4. Exit${RESET}"
echo -e "${BG_BLACK}${WHITE}${BOLD}==================================${RESET}\n"
printf "%b"  "${BG_GREEN}${WHITE}${BOLD}Choose the options from above:${RESET}  "
cn=$((cn+1))
printf "%b" "${RED}"
read choice
printf "%b" "${RESET}"
echo -e   "\n${BG_YELLOW}${BLACK}Loading....\n${RESET}"

#Start Game
case $choice in
1)
clear
start_code 2
cho='y'
echo -e "                                          ${BG_MAGENTA}${YELLOW}${BOLD}==========================${RESET}"
echo -e "                                          ${BG_MAGENTA}${GREEN}${BOLD}|| WELOCOME TO THE GAME ||${RESET}"
echo -e "                                          ${BG_MAGENTA}${YELLOW}${BOLD}==========================${RESET}"
echo -e "${RESET}"
echo -e "                                          ${BG_YELLOW}${RED}${BOLD}IDENTITY${RESET}"
printf "%b" "${GREEN}Enter your name:${RESET}  ${CYAN}${BOLD}"
read user
while [[ $cho != 'B' && $cho != 'b' ]];
do
echo -e "${BG_BLACK}${BOLD}${CYAN}1. Single mode${RESET}"
echo -e "${BG_BLACK}${BOLD}${CYAN}2. Computer mode${RESET}"
echo -e "${BG_BLACK}${BOLD}${CYAN}3. Multiplayer mode${RESET}"
printf "%b" "\n${BG_GREEN}${RED}${BOLD} Dear $user! Choose any ONE mode:${RESET} ${BG_WHITE}${RED} (default 1)${RESET}:  \n"
read n
if [[ $n == 2 ]];
then
clear
start_code 2
computer_mode
elif [[ $n == 3 ]];
then
clear
start_code 2
printf "%b" "${GREEN}Enter Other Player's name:${RESET}  ${CYAN}${BOLD}"
read user1
echo -e "${RESET}"
Multiplayer
else
clear
start_code 2
single_mode
fi
printf "%b" "\n${BG_WHITE}${BLUE}${BOLD}Wanted to play again??${RESET} ${BG_GREEN}${RED}('Y' FOR YES 'B' FOR BACK):$RESET  "
read cho
clear
start_code 2
done
;;

#Difficulty
2)
clear
start_code 2
echo -e "                  ${BG_WHITE}${BLUE}${BOLD}${UNDERLINE}Enter the numbers below to change the difficulty Level${RESET}\n"
echo -e "${GREEN}${BOLD} 1. For Easy${RESET}"
echo -e "${YELLOW}${BOLD} 2. For Normal${RESET}"
echo -e "${RED}${BOLD} 3. For Hard${RESET}"
echo -e "${YELLOW}${BOLD}                                  Default is Easy\n${RESET}"
printf "%b" "${BG_WHITE}${RED} Enter Any LEVEL:${RESET} ${GREEN}"
read ch
printf "%b" "${RESET}"
case $ch in
1)
Difficulty=8
echo -e "                                                 ${BG_BLUE}${GREEN}${BOLD} Level set to Easy ${RESET}\n"
;;
2)
Difficulty=6
echo -e "                                                 ${BG_BLUE}${YELLOW}${BOLD} Level set to Normal ${RESET}\n"
;;
3)
Difficulty=4
echo -e "                                                 ${BG_BLUE}${RED}${BOLD} Level set to Hard ${RESET}\n"
;;
*)
Difficulty=8
esac
;;

#Leaderboard
3)
clear
start_code 2
echo -e "${GREEN}${BOLD}"
echo -e "Single Player Score= $single_score"
echo -e "Computer vs Player Score= $computer_score"
echo -e "Player vs Player Score= $Multi_player"
;;
*)

;;
esac

echo -e "\n${YELLOW}Wanted to Choose or Exit??${RESET} ${BG_WHITE}${RED}${BOLD}(Y for yes , E for Exit)${RESET}"
read ch
done
clear
start_code 2
echo -e "${BOLD}${GREEN}Exiting the program. Goodbye!${RESET}"
