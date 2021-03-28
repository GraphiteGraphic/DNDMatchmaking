const demoData = [
    { GM: "Bob", Time: new Date(2021, 2, 21, 8, 12), Name: "Foobar", Description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Massa id neque aliquam vestibulum morbi. Viverra aliquet eget sit amet. Odio euismod lacinia at quis risus sed vulputate odio ut. Volutpat ac tincidunt vitae semper quis lectus nulla. Ultricies leo integer malesuada nunc vel risus commodo. Dui vivamus arcu felis bibendum ut. Vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant. Viverra justo nec ultrices dui sapien. Mattis aliquam faucibus purus in massa tempor. Consequat mauris nunc congue nisi vitae suscipit. Arcu non sodales neque sodales ut etiam sit amet. Lectus magna fringilla urna porttitor. Cras tincidunt lobortis feugiat vivamus.", Players: ["Bob", "Bill", "Steve"] },
    { GM: "Bob", Time: new Date(2021, 2, 21, 7, 30), Name: "Barfoo", Description: "Aenean sed adipiscing diam donec adipiscing tristique risus. Orci eu lobortis elementum nibh tellus molestie nunc. Aliquam purus sit amet luctus venenatis lectus magna. Velit euismod in pellentesque massa placerat duis ultricies. Pellentesque sit amet porttitor eget dolor. Nam libero justo laoreet sit amet cursus sit. Ut sem viverra aliquet eget sit amet tellus cras adipiscing. Elementum pulvinar etiam non quam lacus suspendisse faucibus. Sapien et ligula ullamcorper malesuada. Faucibus ornare suspendisse sed nisi lacus. Senectus et netus et malesuada. Gravida neque convallis a cras semper. Semper viverra nam libero justo laoreet sit amet cursus sit.", Players: ["Bob", "Bill", "Steve"] }
]

const CURRENT_DATE = new Date();
const weekStart = new Date(CURRENT_DATE.getFullYear(), CURRENT_DATE.getMonth(), CURRENT_DATE.getDate() - CURRENT_DATE.getDay());
const TIME_ZONE = (CURRENT_DATE.getTimezoneOffset() / 60);
let Month = weekStart.getMonth();
let Year = weekStart.getFullYear();
let Day = weekStart.getDate();

function checkDay(check_day, month, year) {
    const DAYS_OF_MONTH = [31, year % 4 == 0 ? 29 : 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

    while (check_day < 1) {
        month--;
        if (month < 0) {
            month = 11;
            year--;
        }
        check_day += DAYS_OF_MONTH[month];
    }

    while (check_day > DAYS_OF_MONTH[month]) {
        check_day -= DAYS_OF_MONTH[month];
        month++;
        if (month > 11) {
            month = 0;
            year++;
        }
    }

    return `${month + 1}/${check_day}`;
}

function fillTime(day, month, year) {
    const DAYS_OF_WEEK = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
    const timeRow = document.querySelectorAll('td.Date');
    for (let i = 0; i < 7; i++) {
        timeRow[i].innerText = `${DAYS_OF_WEEK[i]} ${checkDay(day, month, year)}`;
        day++;
    };
}

function insertMissions(data) {
    let daysOfWeek = document.querySelector('tbody');
    for (let i = 0; i < 7; i++) {
        //Create Day of Week end marker
        let week = document.createElement('tr');
        week.classList.add('Break')
        daysOfWeek.appendChild(week);
        let dayName = document.createElement('td');
        dayName.classList.add('Date');
        week.appendChild(dayName);
        
        //Create and Load game data per day
        let gamesPerDay = demoData.filter((game) => {return `${game.Time.getMonth() + 1}/${game.Time.getDate()}` === checkDay((Day + i), Month, Year)});
        for (let j = 0; j < gamesPerDay.length; j++){
            newRow = document.createElement('tr');
            daysOfWeek.appendChild(newRow);
            newRow.appendChild(document.createElement('td'));
            for(prop in gamesPerDay[j]){
                gameData = document.createElement('td');
                if(prop == "Time"){
                    let AMPM = gamesPerDay[j][prop].getHours() + TIME_ZONE >= 12 ? "PM" : "AM"
                    let hour = (gamesPerDay[j][prop].getHours() + TIME_ZONE) % 12 == 0 ? 12 : (gamesPerDay[j][prop].getHours() + TIME_ZONE) % 12;
                    gameData.innerText = `${hour}:${gamesPerDay[j][prop].getMinutes()} ${AMPM}`;
                }
                else{
                    gameData.innerText = gamesPerDay[j][prop].toString()
                }
                newRow.appendChild(gameData);
            }
        }
    }
}

document.addEventListener('DOMContentLoaded', () => {
    insertMissions(demoData);
    fillTime(Day, Month, Year);
})