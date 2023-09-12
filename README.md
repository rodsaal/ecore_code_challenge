# README

# Role Management Application

## Introduction
This application provides a service to manage roles, team members, and their associations. It allows you to perform various actions related to roles within teams.

## Requirements
- Ruby [3.0.0]
- Rails [7.0.8]

## Installation
You should clone the repository from the URL: https://github.com/rodsaal/ecore_code_challenge.

## Running the Application
To Create a New Role:

Open Postman:

Open the Postman application on your computer.

Create a new request:

Click on the "New" button to create a new request.

Set up the request details:

Choose the POST method.
Enter the URL to create a new role. For example, http://localhost:3000/api/roles.

Click on the Body tab.
Choose the format (JSON) and enter the data for the new role. For example:

{
  "role": {
    "name": "Product Owner"
  }
}

Send the request:If the role is created successfully, you will see a response with a status of 201 Created, along with details of the created role.

To assign a role to a team member via Postman:

Choose the POST method.
Enter the URL to assign a role to a team member. For example, http://localhost:3000/api/roles/assign_role.

 send the payload:

{
  "user_id": "fd282131-d8aa-4819-b0c8-d9e0bfb1b75c",
  "team_id": "7676a4bf-adfe-415c-941b-1739af07039b",
  "role_id": 1
}

# ecore_code_challenge
