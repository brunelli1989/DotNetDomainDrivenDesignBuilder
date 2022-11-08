dotnet new sln -o MySolution

cd MySolution

dotnet new gitignore

dotnet new webapi --output src/MySolution.WebApi
dotnet sln MySolution.sln add src/MySolution.WebApi/MySolution.WebApi.csproj --solution-folder "1 - Presentation"

dotnet new classlib --output src/MySolution.WebApi.Models
dotnet sln MySolution.sln add src/MySolution.WebApi.Models/MySolution.WebApi.Models.csproj --solution-folder "1 - Presentation"

dotnet new classlib --output src/MySolution.Application
dotnet sln MySolution.sln add src/MySolution.Application/MySolution.Application.csproj --solution-folder "2 - Application"

dotnet new classlib --output src/MySolution.Domain
dotnet sln MySolution.sln add src/MySolution.Domain/MySolution.Domain.csproj --solution-folder "3 - Domain"

dotnet new classlib --output src/MySolution.Infra.Data
dotnet sln MySolution.sln add src/MySolution.Infra.Data/MySolution.Infra.Data.csproj --solution-folder "4 - Infra/4.1 - Data"

dotnet new classlib --output src/MySolution.Infra.CrossCutting
dotnet sln MySolution.sln add src/MySolution.Infra.CrossCutting/MySolution.Infra.CrossCutting.csproj --solution-folder "4 - Infra/4.2 - CrossCutting"

dotnet new classlib --output src/MySolution.Infra.CrossCutting.IoC
dotnet sln MySolution.sln add src/MySolution.Infra.CrossCutting.IoC/MySolution.Infra.CrossCutting.IoC.csproj --solution-folder "4 - Infra/4.2 - CrossCutting"

dotnet new xunit --output tests/MySolution.UnitTest
dotnet sln MySolution.sln add tests/MySolution.UnitTest/MySolution.UnitTest.csproj --solution-folder "5 - Tests"

dotnet new xunit --output tests/MySolution.IntegrationTest
dotnet sln MySolution.sln add tests/MySolution.IntegrationTest/MySolution.IntegrationTest.csproj --solution-folder "5 - Tests"

dotnet add src/MySolution.WebApi/MySolution.WebApi.csproj reference src/MySolution.WebApi.Models/MySolution.WebApi.Models.csproj
dotnet add src/MySolution.WebApi/MySolution.WebApi.csproj reference src/MySolution.Application/MySolution.Application.csproj
dotnet add src/MySolution.Application/MySolution.Application.csproj reference src/MySolution.Domain/MySolution.Domain.csproj
dotnet add src/MySolution.Infra.Data/MySolution.Infra.Data.csproj reference src/MySolution.Domain/MySolution.Domain.csproj

dotnet add src/MySolution.Infra.CrossCutting.IoC/MySolution.Infra.CrossCutting.IoC.csproj reference src/MySolution.Domain/MySolution.Domain.csproj
dotnet add src/MySolution.Infra.CrossCutting.IoC/MySolution.Infra.CrossCutting.IoC.csproj reference src/MySolution.Application/MySolution.Application.csproj
dotnet add src/MySolution.Infra.CrossCutting.IoC/MySolution.Infra.CrossCutting.IoC.csproj reference src/MySolution.Infra.Data/MySolution.Infra.Data.csproj

dotnet add src/MySolution.WebApi/MySolution.WebApi.csproj reference src/MySolution.Infra.CrossCutting/MySolution.Infra.CrossCutting.csproj
dotnet add src/MySolution.Application/MySolution.Application.csproj reference src/MySolution.Infra.CrossCutting/MySolution.Infra.CrossCutting.csproj
dotnet add src/MySolution.Domain/MySolution.Domain.csproj reference src/MySolution.Infra.CrossCutting/MySolution.Infra.CrossCutting.csproj

dotnet add tests/MySolution.UnitTest/MySolution.UnitTest.csproj reference src/MySolution.WebApi/MySolution.WebApi.csproj
dotnet add tests/MySolution.IntegrationTest/MySolution.IntegrationTest.csproj reference src/MySolution.WebApi/MySolution.WebApi.csproj

