# README

![Leaves Management]

This Project is to manages different Leave requests in a company. system allows you to apply for Leave and get it accepted by your Head(Here referred as Admin)

 
 **Requirements:**
- **Ruby** 2.5+
- **Rails** 5+
- **Mysql**

 **Setup:**
- **rails db:create**
- **rails db:migrate**
- **rails db:seed** 

 **Note**
- **After running rails db:seed Admin user will be Aautomatically created with name as 'Admin' email as *****@gmail.com and password is admin123**

 **Flows**
- **Admin Login**
   Tabs - **Users** -List of Users belongs to the Admin
        - **Settings** - To Configure Settings like Maximum leaves that are offered.
- **Normal User Login**
   Tabs
     **User Profile Page** - Includes User Profile and Leave requests

**Once Leave is Created or Modified, Admin will get mail with leave request details . Admin will either accept or reject the request from mail. Response will be send back to User. Note that To Accept or Reject the leave request admin must be logged in.**
