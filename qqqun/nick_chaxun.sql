declare @Nick nvarchar(100)='名字'
declare @sql nvarchar(4000)  
declare @dbIdx int = 1  
  
if OBJECT_ID('tempdb.dbo.#NickList') is not null  
drop table #NickList  
if OBJECT_ID('tempdb.dbo.#NickDetail') is not null  
drop table #NickDetail  
  
create table #NickList  
(
    QQNum int,  
    Nick nvarchar(20),  
    Age int,  
    Gender int,  
    Auth int,  
    QunNum int,  
    Title nvarchar(22),  
    QunText nvarchar(80)  
)  
create table #NickDetail  
(  
    QunNum int,  
    Title nvarchar(22),  
    QunText nvarchar(80)  
)  

while @dbIdx <= 11  
begin  
declare @tblIdx int = 1  
declare @tblName nvarchar(50)  
  
while @tblIdx <= 100  
begin  
set @tblName = 'GroupData' + CONVERT(nvarchar(2), @dbIdx) + '.dbo.Group'  
set @tblName += CONVERT(nvarchar(5), (@dbIdx - 1) * 100 + @tblIdx)  
  
set @sql = 'select  QQNum, Nick, Age,Gender, Auth, QunNum from '  
set @sql += @tblName + ' where Nick =' +char(39)+ CONVERT(nvarchar(15), @Nick)  +char(39) 
  
print @sql
insert into #NickList(QQNum, Nick,Age,Gender,Auth,QunNum)  exec(@sql)  
  
print @tblname + ' OK'  
  
set @tblIdx += 1  
end  
  
set @dbIdx += 1  
end  

select  * from #NickList order by QQNum asc 
--group by QQNum  order by QQNum asc,count(distinct QQNum)