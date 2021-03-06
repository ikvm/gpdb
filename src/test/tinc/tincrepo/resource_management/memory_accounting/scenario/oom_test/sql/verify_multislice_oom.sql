-- @author ramans2
-- @created 2014-02-05 12:00:00
-- @modified 2014-02-05 12:00:00
-- @description Check segment log to verify that there are no ERROR/PANIC messages

-- SQL to check segment logs for ERROR or PANIC messages
select logseverity, logstate, logmessage from gp_toolkit.__gp_log_segment_ext where logstate = 'XX000' and  logtime >= (select logtime from gp_toolkit.__gp_log_master_ext where logmessage like 'statement: select 4 as oom_test;' order by logtime desc limit 1) order by logtime desc;
