# Assignment-3

## Overview
In this project we were tasked (no pun intended) to make a task management app that supports the addition, deletion and completion of tasks.

## Home Page (ToDo Page)
In this page the user can add tasks to their list, and also mark them as completed.
<br><br>

<img width="203" alt="assignment3_p1" src="https://github.com/hmody360/Assignment-3/assets/98014312/f45c1590-66da-4c4e-8452-df7657fb51d0">
<br><br>

### Adding a Task
This functionality has three possible outcomes:

- Outcome 1: Successfuly adding a task

<img width="205" alt="assignment3_p2" src="https://github.com/hmody360/Assignment-3/assets/98014312/00977ee2-5d99-4c74-9e5a-26d8be414963">
<img width="202" alt="assignment3_p3" src="https://github.com/hmody360/Assignment-3/assets/98014312/6fddc51b-5847-452e-91bc-6d342cb881b8">
<br><br>

- Outcome 2: Adding a task that already exists:

<img width="205" alt="assignment3_p4" src="https://github.com/hmody360/Assignment-3/assets/98014312/4db5313c-4f07-4c01-9757-352653919634">
<img width="206" alt="assignment3_p5" src="https://github.com/hmody360/Assignment-3/assets/98014312/c8624135-b91f-41e0-91c0-4daa76ba3780">
<br><br>

- Outcome 3: Adding a task with an empty TextField

<img width="204" alt="assignment3_p6" src="https://github.com/hmody360/Assignment-3/assets/98014312/0e49ee3f-82ca-46be-a167-0775631dbc74">
<img width="205" alt="assignment3_p7" src="https://github.com/hmody360/Assignment-3/assets/98014312/b515797d-a706-4fa3-9f7c-641f1e2826c4">
<br><br>

### Completing a task (moving a task to completed list)
This functionality has only one outcome, where the task is moved to the complete list (just checking its mark and moving it), this functionality can be done in both the ToDo page and the Modify page:

<img width="200" alt="assignment3_p8" src="https://github.com/hmody360/Assignment-3/assets/98014312/f3cb5a39-6aeb-4ee0-b740-f8d63453ebb2">
<img width="201" alt="assignment3_p9" src="https://github.com/hmody360/Assignment-3/assets/98014312/5758ab19-4224-49aa-9d4e-f95362d82260">
<br><br>

## Modify Page
In This page the user can check complete a task, edit a task and remove a task, or all incomplete tasks.
<br><br>

<img width="200" alt="assignment3_p10" src="https://github.com/hmody360/Assignment-3/assets/98014312/37b33df9-be13-4568-94b6-21fff3f8340f">

### Delete a task
This functionality only has one outcome where the task is deleted:

<img width="202" alt="assignment3_p11" src="https://github.com/hmody360/Assignment-3/assets/98014312/6049d933-5232-446a-9383-3de1f4f52b51">
<img width="203" alt="assignment3_p12" src="https://github.com/hmody360/Assignment-3/assets/98014312/ce13a385-6cd3-4ad4-b362-6ca1a8f5b0b2">
<br><br>

### Deleting all tasks
This functionality has two outcomes depending on the current state of the list:

- Outcome 1: The user deletes all incomplete tasks

<img width="204" alt="assignment3_p13" src="https://github.com/hmody360/Assignment-3/assets/98014312/3f650a13-035b-4b4c-833b-4bbc4bf69462">
<img width="205" alt="assignment3_p14" src="https://github.com/hmody360/Assignment-3/assets/98014312/c043a923-06cc-4e2a-847f-9e1735666f24">

<br><br>

- Outcome 2: The user tries to delete the list when it's empty or dosen't contain any incomplete tasks.

<img width="203" alt="assignment3_p15" src="https://github.com/hmody360/Assignment-3/assets/98014312/3c4ec41b-2a46-4115-a469-c21d6780d259">
<img width="207" alt="assignment3_p16" src="https://github.com/hmody360/Assignment-3/assets/98014312/012a2aca-a865-49f6-95be-797abf5fb5aa">
<br><br>

### Edit a task
This functionality allows the user to edit a task, when clicking on edit, they will get the text from the task in a textfield and are able to edit it.

it has three possible outcomes, similar to the add functionality.

- Outcome 1: The user edits the task sucessfully

<img width="205" alt="assignment3_p17" src="https://github.com/hmody360/Assignment-3/assets/98014312/7661cf52-22ca-49cc-87dc-7de0e62123d2">
<img width="203" alt="assignment3_p18" src="https://github.com/hmody360/Assignment-3/assets/98014312/1939dbd9-8450-4300-b493-4086f430d670">
<img width="202" alt="assignment3_p19" src="https://github.com/hmody360/Assignment-3/assets/98014312/8b575eb1-399e-4c1f-a23f-f3d17caa7ebd">
<br><br>

- Outcome 2: the user tried editing a task to one that already exists

<img width="203" alt="assignment3_p23" src="https://github.com/hmody360/Assignment-3/assets/98014312/71f4c36e-e2f8-4891-a403-a93ec61c8ea4">
<img width="203" alt="assignment3_p20" src="https://github.com/hmody360/Assignment-3/assets/98014312/fb1a7578-7f2e-45e1-84a1-ab95eff298d6">
<br><br>

- Outcome 3: the user tries to make the task an empty field

<img width="198" alt="assignment3_p24" src="https://github.com/hmody360/Assignment-3/assets/98014312/d2afc286-e2fa-4821-97b6-e5d77a485921">
<img width="203" alt="assignment3_p25" src="https://github.com/hmody360/Assignment-3/assets/98014312/b8642cee-0024-47dc-b797-258025b41481">
<br><br>

## Completed List
This page has two states, wether its empty or filled with completed tasks, and it has one functionality which allows the user to return a completed task to their incomplete list (if done by mistake for example)
<br><br>

### Completed list is empty
If no tasks are set as completed the page that will be shown will look like this:

<img width="202" alt="assignment3_p28" src="https://github.com/hmody360/Assignment-3/assets/98014312/3a659498-f98f-46e7-bad8-4f8df1e1f3f6">
<br><br>

### Completed List has elements

<img width="203" alt="assignment3_p27" src="https://github.com/hmody360/Assignment-3/assets/98014312/1b64a07d-3d0c-46ec-8031-809bd34c53f8">
<br><br>

### Mark Task as incomplete
This functionality allows the user to put the task back to the incomplete list, by clicking on the checkbox again in the completed page:

<img width="201" alt="assignment3_p21" src="https://github.com/hmody360/Assignment-3/assets/98014312/11721c54-fb32-497b-8314-e3e50ea8fddd">
<img width="200" alt="assignment3_p22" src="https://github.com/hmody360/Assignment-3/assets/98014312/a2aa8152-f867-4f06-bda8-5e4c2680c977">
<br><br>

## GetStorage Functionality
This app implements GetStorage and saves the state of all tasks within the app, like this:

<img width="202" alt="assignment3_p26" src="https://github.com/hmody360/Assignment-3/assets/98014312/e04ab671-da90-4da2-afa3-279ed260270f">
<img width="203" alt="assignment3_p27" src="https://github.com/hmody360/Assignment-3/assets/98014312/ae7f95de-401e-4486-b799-25857758347a">
<br><br>

## Used Packages

- GetIt
- GetStorage
- Flutter_BLoC


## P.S
Thank you for reading this, and I hope you will enjoy using the app, your feedback is important, and have a nice day.