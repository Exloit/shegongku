CREATE PROCEDURE QUNCY_CX @QunNum int=null
as
BEGIN
declare @sql varchar(8000)
--群成员
set @sql = 'select * from GroupData' + CONVERT(varchar(5), @QunNum / 10000000 + 1) + '.dbo.'
set @sql += 'Group' + CONVERT(varchar(10), @QunNum / 100000 + 1) + ' where QunNum=' + Convert(varchar(20),@QunNum)
exec(@sql)
print(@sql)
END
GO