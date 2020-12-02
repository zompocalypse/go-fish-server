# Go Fish Server!

Here's the backend which serves our [Go Fish Game Application](https://capstone-3-client-deploy.vercel.app/)! The backend manages endpoints that use CRUD methods. You can learn more about the Front End code [here](https://github.com/thinkful-ei-rabbit/capstone-three-client-team-b)

## Table of Contents

<!-- - [Demo Account](#Demo-Account)
- [Quick App Demo](#Quick-App-Demo) -->

- [API Documentation](#API-Documentation)
  - [All Endpoints](#All-Endpoints)
  - [JWT Auth](#JWT-Auth)
  - [Additional Endpoints](#Additional-Endpoints)
- [Tech Stack](#Tech-Stack)
  - [Back End](#Backend-End)
  - [Testing](#Testing)
  - [Database](#Database)
  - [Production](#Production)
- [Getting Started](#Set-up)
  - [Client Side Setup](#Frontend-Setup)
  <!-- - [Scripts to get started](#Scripts-to-get-started) -->
  - [Deploying](#Deploying)
- [Upcoming Features](#Upcoming-Features)
- [About the Devs](#About-the-Devs)
- [Special Thanks](#Special-Thanks)

## API Documentation

### All Endpoints

-- /api/users
-- /api/auth

<!-- -- socket? -->
<!-- -- /api/game -->

### JWT Auth

- `POST` request made to `/api/auth/login`

* The body of the request consists of:

```
{
  email: '',
  password: ''
}
```

### Additional Endpoints

(e.g. registering, playing the game)

- `POST` request made to `/api/users`

* The body of the request consists of:

```
{
    "playerName": " ", // requires a unique username, so other users cannot already have that username
    "email": " ", // requires @email.com formatting
    "password": " " // requires 1 uppercase, 1 lowercase, 1 special character and a number
}
```

<!-- socket.io endpoints explained here -->

- `socket.on` establishes a server connection
- At the start of the game users join the server:

```
{
   socket.on('joinServer', (userObj) => {


    // define socket identity info before join
        socket.nickname = userObj.playerName;
        socket.roomNumber = userObj.room;
        socket.player_id = userObj.user_id;
    //  NOTE: socket.id is auto generated
    if (ServerRooms.activeRooms[socket.roomNumber]) {
      if (ServerRooms.activeRooms[socket.roomNumber].started === true) {
        return socket.emit('server join denial');
      }
    }
}
```

- `socket.emit` sends a message to either all users in the game or a specific user in the game
- For example, when a player asks another player for a card:

```
{
    //`io.to` targets that player `.emit` sends the specific response, which is handled by the front end
    io.to(socket.roomNumber).emit('messageResponse', {
      user: 'Server Message',
      value: `${asker.name} is asking  ${requested.requestedName} for a ${rankReq}.`,
    });
}
```

## Tech Stack

### Back End

- Node and Express
  - Authentication using JWT
  - RESTful Api
- Socket.io
- HTML5
- CSS3

### Testing

- Supertest (integration)
- Mocha and Chai (unit)

### Database

- Postgres
- Knex.js - SQL wrapper

### Production

- Deployed via Heroku

## Set up

Complete the following steps to start a new project (NEW-PROJECT-NAME):

1. Clone this repository to your local machine `git clone capstone-three-server-team-b`
2. `cd` into the cloned repository
3. Make a fresh start of the git history for this project with `rm -rf .git && git init`
4. Install the node dependencies `npm install`
5. Create an `.env` that will be ignored by git and read by the express server `touch .env`
6. Edit the contents of the `package.json` to use NEW-PROJECT-NAME instead of `"name": "go-fish-server",`

### Client Side Setup

Follow the [setup](https://github.com/thinkful-ei-rabbit/capstone-three-client-team-b) instructions to get `Go Fish Client` up and running.

## Scripts to get started

Start the application `npm start`

Start nodemon for the application `npm run dev`

Run the tests `npm test`

## Deploying

When your new project is ready for deployment, add a new Heroku application with `heroku create`. This will make a new git remote called "heroku" and you can then `npm run deploy` which will push to this remote's master branch.

## Upcoming Features

<!-- ### We're working dilligently to incorporate these next user stories! -->

- Returning users can edit their profile
- Users can view a score board

## About the Devs

-[Caleb](https://github.com/cabejackson) -[Harry](https://github.com/cabejackson) -[Jason](https://github.com/cabejackson) -[Malik](https://github.com/cabejackson) -[Michael](https://github.com/cabejackson)

## Special Thanks

To Thinkful's Engineering Immersion Course TAs, instructors and mentors!
