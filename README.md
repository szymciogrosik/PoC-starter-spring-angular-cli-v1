# Starter project (*Spring-Boot, Angular2, JWT*)

## How run project?
0. Install [Lombok](https://projectlombok.org/) library.
1. Install [Node.js](https://nodejs.org/en/download/) 
2. In *frontend\src\main\angular* directory use command `npm install` for install Angular2 libraries
3. Instal additional libraries for Angular
     ```
     npm install angular2-jwt
     npm install ng2-cookies
     
     npm install --save bootstrap (in future)
     ```
4. Run script from main directory in order:
     - **runDatabase.bat**
     - **runBack.bat**
     - **runFront.bat**<br/>
 
 
## Angular CLI
it's required if you start angular by CLI `ng serve`, but you can still run like that `npm start`.
```
npm install -g @angular/cli
```
 
## Done
Angular server runs at **localhost:4200**<br/>
SpringBoot runs at **localhost:8080**
<br/><br/>
**_User with role->admin_**<br/>
**Login**: *admin*<br/>
**Password**: *admin*<br/><br/>
**_User with role->user_**<br/>
**Login**: *user*<br/>
**Password**: *admin*<br/>
