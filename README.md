# PhysioLink-Backend
Backend source code (Team 11) for Development of Android Applications, University of Macedonia (UoM)
<br>
This app is written in Nodejs and specifically using the Expressjs framework.
<br>
<img src="screenshots/api-reference.png" />
<hr>

### Team members
<ul>
    <li><b>Kote Kostandin</b></li>
    <li><b>Theodora Katseisvili</b></li>
    <li><b>Vicky Limenidou</b></li>
    <li><b>Charisiadis Aristotelis</b></li>
    <li><b>Panagiotis Stergioulas-Bolis</b></li>
    <li><b>Koudouni Alexandra</b></li>
    <li><b>Shenepremte Eleni</b></li>
    <li><b>Sophocles Panteris</b></li>
    <li><b>Iason Karafoulidis</b></li>
    <li><b>Christos Tsarchopoulos</b></li>
</ul>
<hr>

### Functionalities
The backend app follows and supports the requirements as given from the assignment. 
Furthermore, extra functionalities were implemented, such as:
<ul>
	<li><b>Notification system</b></li>
	<li><b>Email system</b></li>
	<li><b>Profile Image uploading</b></li>
	<li><b>Personalized doctor/physiotherapist services</b></li>
	<li><b>Updating user information (password, username, email etc.)</b></li>
	<li><b>More patient/doctor information (city, address, postal code)</b></li>
</ul>

You can find out more about the functionalities in the [API Documentation Reference](https://github.com/setokk/PhysioLink-Backend/blob/main/documentation/documentation.html)

<hr>

### Running the app
There are 2 ways to run the app (using docker or installing locally):
#### - Docker (recommended)
```
** IMPORTANT **
Because MariaDB listens on 3306, make sure there are no running processes using port 3306 before following the steps below.

Run:
1) docker-setup.bat (or docker-setup.sh | they can be found in the root path of the project)
2) docker exec -it physiolink-db mariadb --user root -proot
3) Copy and paste all SQL code from db.sql in the interactive terminal (db.sql can also be found in the root path of the project)
4) Done!
```

<hr>

### Requirements

<hr>

### Documentation
You can find the backend API reference in "_/documentation/documentation.html_" or "_localhost:3000/physiolink/api_"

<hr>
