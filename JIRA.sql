/*******************************************************************/
-- JIRA
-- RG-908
/*******************************************************************/

select * from jira.jiraissue
join jira.project on project.id = jiraissue.project
where project.pkey = 'PROG';

SELECT project.pkey, jiraissue.issuenum, changeitem.oldstring, changeitem.newstring, changegroup.author, changegroup.created 
FROM jira.changeitem 
JOIN jira.changegroup ON changeitem.groupid=changegroup.id 
JOIN jira.jiraissue ON changegroup.issueid=jiraissue.id 
JOIN jira.project ON jiraissue.project=project.id 
WHERE (changeitem.field='status' 
    AND changegroup.created >= current_date - interval '7' day);
    

