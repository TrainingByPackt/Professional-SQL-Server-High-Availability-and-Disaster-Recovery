-- Change query mode to SQLCMD
:Connect DPLPR
USE [master]

DROP AVAILABILITY GROUP [DPLAG];

GO

:Connect DPLHA

use master

DROP DATABASE [Sales]
GO
DROP DATABASE [Finance]


:Connect DPLDR

use master

DROP DATABASE [Sales]
GO
DROP DATABASE [Finance]



