dotnet new sln -o Vitas
cd Vitas

dotnet new webapi --output src/Vitas.WebApi
dotnet sln Vitas.sln add src/Vitas.WebApi/Vitas.WebApi.csproj --solution-folder "1 - Presentation"

dotnet new classlib --output src/Vitas.WebApi.Models
dotnet sln Vitas.sln add src/Vitas.WebApi.Models/Vitas.WebApi.Models.csproj --solution-folder "1 - Presentation"

dotnet new classlib --output src/Vitas.Application
dotnet sln Vitas.sln add src/Vitas.Application/Vitas.Application.csproj --solution-folder "2 - Application"

dotnet new classlib --output src/Vitas.Domain
dotnet sln Vitas.sln add src/Vitas.Domain/Vitas.Domain.csproj --solution-folder "3 - Domain"

dotnet new classlib --output src/Vitas.Infra.Data
dotnet sln Vitas.sln add src/Vitas.Infra.Data/Vitas.Infra.Data.csproj --solution-folder "4 - Infra/4.1 - Data"

dotnet new classlib --output src/Vitas.Infra.CrossCutting.IoC
dotnet sln Vitas.sln add src/Vitas.Infra.CrossCutting.IoC/Vitas.Infra.CrossCutting.IoC.csproj --solution-folder "4 - Infra/4.2 - CrossCutting"

dotnet new xunit --output tests/Vitas.UnitTest
dotnet sln Vitas.sln add tests/Vitas.UnitTest/Vitas.UnitTest.csproj --solution-folder "5 - Tests"

dotnet new xunit --output tests/Vitas.IntegrationTest
dotnet sln Vitas.sln add tests/Vitas.IntegrationTest/Vitas.IntegrationTest.csproj --solution-folder "5 - Tests"


dotnet add src/Vitas.WebApi/Vitas.WebApi.csproj reference src/Vitas.WebApi.Models/Vitas.WebApi.Models.csproj
dotnet add src/Vitas.WebApi/Vitas.WebApi.csproj reference src/Vitas.Application/Vitas.Application.csproj
dotnet add src/Vitas.Application/Vitas.Application.csproj reference src/Vitas.Domain/Vitas.Domain.csproj
dotnet add src/Vitas.Infra.Data/Vitas.Infra.Data.csproj reference src/Vitas.Domain/Vitas.Domain.csproj
dotnet add src/Vitas.Infra.CrossCutting.IoC/Vitas.Infra.CrossCutting.IoC.csproj reference src/Vitas.Domain/Vitas.Domain.csproj
dotnet add src/Vitas.Infra.CrossCutting.IoC/Vitas.Infra.CrossCutting.IoC.csproj reference src/Vitas.Application/Vitas.Application.csproj
dotnet add src/Vitas.Infra.CrossCutting.IoC/Vitas.Infra.CrossCutting.IoC.csproj reference src/Vitas.Infra.Data/Vitas.Infra.Data.csproj

dotnet add tests/Vitas.UnitTest/Vitas.UnitTest.csproj reference src/Vitas.WebApi/Vitas.WebApi.csproj
dotnet add tests/Vitas.IntegrationTest/Vitas.IntegrationTest.csproj reference src/Vitas.WebApi/Vitas.WebApi.csproj