Leniuch

This is Leniuch a rails app designed to manage a team of engeeners.

Main features:

- checking team members status (free/busy)
- adding task (task description, time taken, percent done)
- exporting team reports to CSV file (who was doing what and for how long)

Example usage flow.

1) User logs in
2) He goeas to current status page, and there he can check:
   - who's busy, who's free
   - links to other team members taks page
3) On user task page.
   - if the page belongs to logged user, he can: add/view/remove/edit tasks
   - if this is someone else page, he can add/view tasks
4) On work report page user gets information about all team memebers,
   for current day. This page also allows to export report to csv file
