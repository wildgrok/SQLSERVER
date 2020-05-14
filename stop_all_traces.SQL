use [master];

set nocount on;

declare @result table ([Path] nvarchar(260) not null);

declare trace cursor local fast_forward for select T.id, T.path
                                            from sys.traces as T
                                            where T.is_default != 1;
                                            
open trace;

declare @id int;
declare @path nvarchar(260);

fetch next from trace
  into @id, @path;
  
while @@fetch_status = 0
begin
   execute sp_trace_setstatus
     @traceid = @id,
     @status = 0;
     
   execute sp_trace_setstatus
     @traceid = @id,
     @status = 2;
     
   if (@path is not null)
   begin
     insert into @result([Path])
       values (@path);
   end;

       fetch next from trace
         into @id, @path;
end;

close trace;
deallocate trace;

select R.[Path] as [Path]
from @result as R;