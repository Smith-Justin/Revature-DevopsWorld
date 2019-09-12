FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS buildstage
WORKDIR /aspnet
COPY ["DevopsDemo.Client/DevopsDemo.Client.csproj", "DevopsDemo.Client/"]
RUN dotnet restore DevopsDemo.Client/DevopsDemo.Client.csproj
COPY . .
WORKDIR /aspnet/DevopsDemo.Client
RUN dotnet build DevopsDemo.Client.csproj

FROM buildstage AS publishstage
RUN dotnet publish DevopsDemo.Client.csproj --no-restore -c Release -o /app

FROM mcr.microsoft.com/dotnet/core/aspnet:2.2
WORKDIR /deploy
COPY --from=publishstage /app .
CMD [ "dotnet", "DevopsDemo.Client.dll" ]